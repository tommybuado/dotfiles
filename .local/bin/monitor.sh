#!/bin/sh
MONITOR="$(echo -e 'HDMI\nDisplayPort' | dmenu $@)"
if [ -z "$MONITOR" ]; then
	exit 0
fi

if [ "$MONITOR" = "HDMI" ]; then
	xrandr --output HDMI2 --auto --right-of eDP1
fi

if [ "$MONITOR" = "DisplayPort" ]; then
	xrandr --output HDMI2 --off
fi
