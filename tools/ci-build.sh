#!/bin/bash
#
# Usage: tools/ci-build.sh linux|macos|windows
#
# Timeless Tales is only data, so there is no game to compile: this script
# assembles the artifacts that other games ship, out of the engine the
# workflow built and a launcher script that runs that engine with -d pointed
# at the game tree.

set -ex

GAME_ID=timeless-tales
GAME_NAME="Timeless Tales"

# The directories of the repository that make up the game.
GAME_DATA="campaigns graphics maps music scripts sounds vendor"

if [ -z "${GAME_SRC}" ]; then
    GAME_SRC=$(cd "$(dirname "$0")" && cd .. && pwd)
fi
ENGINE_SRC=${ENGINE_SRC:-../stratagus}
ENGINE_BUILD=${ENGINE_BUILD:-$ENGINE_SRC/build}
BUILD=${GAME_BUILD:-$GAME_SRC/build}
ASSETS=${RELEASE_ASSETS:-release-assets}

GAME_SRC=$(cd "$GAME_SRC" && pwd)
ENGINE_SRC=$(cd "$ENGINE_SRC" && pwd)
ENGINE_BUILD=$(cd "$ENGINE_BUILD" && pwd)
mkdir -p "$BUILD"
BUILD=$(cd "$BUILD" && pwd)

for candidate in "$ENGINE_BUILD/stratagus" "$ENGINE_BUILD/Release/stratagus.exe" "$ENGINE_BUILD/stratagus.exe"; do
    if [ -e "$candidate" ]; then
        export STRATAGUS="$candidate"
        break
    fi
done
if [ ! -e "$STRATAGUS" ]; then
    echo "no stratagus build under $ENGINE_BUILD" >&2
    exit 1
fi

# The version the game shows in its UI is the version of the release.
version=$(sed -ne 's/^wargus\.Version *= *"\([^"]*\)".*/\1/p' "$GAME_SRC/scripts/stratagus.lua")
if [ -z "$version" ]; then
    echo "no wargus.Version in scripts/stratagus.lua" >&2
    exit 1
fi

case "$1" in
    linux|macos|windows) ;;
    *)
        echo "usage: tools/ci-build.sh linux|macos|windows" >&2
        exit 1
        ;;
esac

# Copy the game tree somewhere, with the directories the repository has.
copy_game_data() {
    local dest=$1
    mkdir -p "$dest"
    for dir in $GAME_DATA; do
        cp -a "$GAME_SRC/$dir" "$dest"/
    done
}

mkdir -p "$ASSETS"

case "$1" in
    linux)
        # Install the engine and the game into a classic /usr tree, which the
        # launcher script then finds relative to itself, and feed that to
        # appimage-builder the way the other games do.
        root=$BUILD
        appdir=$root/AppDir
        rm -rf "$appdir"
        DESTDIR="$appdir" cmake --install "$ENGINE_BUILD"

        data=$appdir/usr/share/games/stratagus/$GAME_ID
        copy_game_data "$data"
        install -m 755 "$GAME_SRC/launcher/timeless-tales.sh" "$appdir/usr/bin/$GAME_ID"
        install -d "$appdir/usr/share/applications"
        install -m 644 "$GAME_SRC/timeless-tales.desktop" "$appdir/usr/share/applications/"
        install -d "$appdir/usr/share/pixmaps" "$appdir/usr/share/icons/hicolor/256x256/apps"
        install -m 644 "$GAME_SRC/timeless-tales.png" "$appdir/usr/share/pixmaps/"
        install -m 644 "$GAME_SRC/timeless-tales.png" "$appdir/usr/share/icons/hicolor/256x256/apps/$GAME_ID.png"

        cat > "$root/appimage-builder.yaml" <<EOF
version: 1
AppDir:
  path: $appdir
  app_info:
    id: com.stratagus.$GAME_ID
    name: '$GAME_NAME'
    icon: '$GAME_ID'
    version: '$version'
    exec: 'usr/bin/stratagus'
    exec_args: '"-d" "\$APPDIR/usr/share/games/stratagus/$GAME_ID" "\$@"'
AppImage:
  arch: '$(uname -m)'
EOF

        builder=$root/tools/appimage-builder.AppImage
        if [ ! -x "$builder" ]; then
            mkdir -p "$(dirname "$builder")"
            curl -L --output "$builder" https://github.com/AppImageCrafters/appimage-builder/releases/download/v1.1.0/appimage-builder-1.1.0-x86_64.AppImage
            chmod +x "$builder"
        fi
        pushd "$root" > /dev/null
        $builder --appimage-extract-and-run --recipe appimage-builder.yaml
        popd > /dev/null
        cp -v "$root"/*.AppImage "$ASSETS"/
        ;;
    macos)
        app=$BUILD/Timeless-Tales.app
        rm -rf "$app"
        mkdir -p "$app/Contents/MacOS" "$app/Contents/Resources"

        cp "$GAME_SRC/mac/Info.plist" "$app/Contents/"

        iconset=$BUILD/timeless-tales.iconset
        rm -rf "$iconset"
        mkdir -p "$iconset"
        for spec in "16 icon_16x16" "32 icon_16x16@2x" "32 icon_32x32" "64 icon_32x32@2x" \
                    "128 icon_128x128" "256 icon_128x128@2x" "256 icon_256x256" "512 icon_256x256@2x" \
                    "512 icon_512x512" "1024 icon_512x512@2x"; do
            set -- $spec
            sips -z "$1" "$1" "$GAME_SRC/timeless-tales.png" --out "$iconset/$2.png" > /dev/null
        done
        iconutil -c icns "$iconset"
        mv "$BUILD/timeless-tales.icns" "$app/Contents/Resources/"

        # The engine and the game share Contents/MacOS, and the launcher
        # starts the engine that lives next to it.
        cp "$STRATAGUS" "$app/Contents/MacOS/stratagus"
        install -m 755 "$GAME_SRC/launcher/timeless-tales-macos.sh" "$app/Contents/MacOS/$GAME_ID"
        copy_game_data "$app/Contents/MacOS"

        dylibbundler -of -cd -b -x "$app/Contents/MacOS/stratagus" -d "$app/Contents/libs/"
        codesign --force --deep --sign - "$app"

        arch=$(uname -m)
        output="$ASSETS/Timeless-Tales-$version-$arch"
        for attempt in 1 2 3; do # mounting fails sporadically, retry a few times
            hdiutil detach "/Volumes/$GAME_NAME" -force || true
            if hdiutil create -volname "$GAME_NAME" -srcfolder "$app" "$output"; then
                exit 0
            fi
            rm -f "$output" "$output.dmg"
            sleep $((attempt * 10))
        done
        hdiutil create -volname "$GAME_NAME" -srcfolder "$app" "$output"
        ;;
    windows)
        # The nsi ships the engine it finds in the build directory next to
        # itself, and makensis runs there.
        engine_dir=$(dirname "$STRATAGUS")
        cp "$engine_dir/stratagus.exe" "$BUILD/"

        # NSIS is put on the machine PATH by the workflow, but a step started
        # after the install does not see that, so look in the usual places too.
        makensis=$(command -v makensis || command -v makensis.exe || true)
        if [ -z "$makensis" ]; then
            for candidate in "/c/Program Files (x86)/NSIS/makensis.exe" "/c/Program Files/NSIS/makensis.exe"; do
                if [ -e "$candidate" ]; then
                    makensis=$candidate
                    break
                fi
            done
        fi
        if [ -z "$makensis" ]; then
            echo "makensis not found" >&2
            exit 1
        fi

        pushd "$BUILD" > /dev/null
        "$makensis" -DSRC="$GAME_SRC" -DBIN="$BUILD" -DQUIET=1 "$GAME_SRC/timeless-tales.nsi"
        popd > /dev/null

        cp "$BUILD"/Timeless-Tales-*.exe "$ASSETS"/
        ;;
esac
