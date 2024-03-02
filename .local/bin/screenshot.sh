#!/bin/sh
send_notification () {
	dunstify -i $HOME/.local/share/icons/dunst/screenshot.png \
		-h string:x-dunst-stack-tag:screenshot "New Screenshot"
}

SCREENSHOTS_DIR="$HOME/Pictures/Screenshots"

if [ ! -d "$SCREENSHOTS_DIR" ]; then
	mkdir -p "$SCREENSHOTS_DIR"
fi

scrot "$SCREENSHOTS_DIR/screenshot_\$wx\$h-%Y%m%d%H%M%S.png"
send_notification
