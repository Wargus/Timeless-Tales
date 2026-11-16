#!/bin/sh
#
# The Timeless Tales launcher inside the macOS app bundle.
#
# The game is only data, so all this launcher has to do is point a Stratagus
# engine at it. The game data and the engine live together in Contents/MacOS
# of the bundle, the way the other Wargus games deploy, and dylibbundler has
# fixed the engine to load its libraries from Contents/libs, so there is
# nothing else to set up.

here=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

cd "$here"

exec ./stratagus -d "$here" "$@"
