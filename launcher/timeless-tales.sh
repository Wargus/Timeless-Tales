#!/bin/sh
#
# The Timeless Tales launcher for Unix-like systems.
#
# The game is only data, so all this launcher has to do is point a Stratagus
# engine at this directory tree. It finds the engine next to itself first, as
# an AppImage or a side-by-side deployment installs them together, and falls
# back to one from PATH otherwise. The data sits in the installed datadir next
# to the launcher, which holds both the system install (/usr/bin, /usr/share)
# and the AppImage (usr/bin, usr/share inside the AppDir).

here=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

data=${TIMELESS_TALES_DATA:-$here/../share/games/stratagus/timeless-tales}

if [ -n "$STRATAGUS" ]; then
	engine=$STRATAGUS
elif [ -x "$here/stratagus" ]; then
	engine=$here/stratagus
else
	engine=stratagus
fi

exec "$engine" -d "$data" "$@"
