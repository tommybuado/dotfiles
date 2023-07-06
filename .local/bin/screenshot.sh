#!/bin/sh
SCREENSHOTS="$HOME/Pictures/Screenshots"
if [ ! -d "$SCREENSHOTS" ]; then
	mkdir -p $SCREENSHOTS
fi

scrot $SCREENSHOTS/screenshot-%s_'$wx$h'.png
