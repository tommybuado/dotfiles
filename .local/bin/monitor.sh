#!/bin/sh
MONITOR="$(echo -e 'HDMI\nDisplayPort' | \
	dmenu -nf '#d0d0d0' -sf '#4eb4fa' $@)"

if [ -z "$MONITOR" ]; then
	exit 0
fi

if [ "$MONITOR" = "HDMI" ]; then
	xrandr --output HDMI2 --auto --right-of eDP1
fi

if [ "$MONITOR" = "DisplayPort" ]; then
	xrandr --output HDMI2 --off
fi

# update desktop wallpapers
feh --randomize --bg-scale $HOME/.local/share/wallpapers
