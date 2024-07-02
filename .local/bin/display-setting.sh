#!/bin/sh
MONITOR="$(echo -e "DUAL\nExternal\nDefault" | dmenu $@)"

if [ "$MONITOR" = "DUAL" ]; then
	POSITION="$(echo -e "Mirror\nLeft\nRight" | dmenu $@)"
	if [ "$POSITION" = "Mirror" ]; then
		xrandr --output HDMI-2 --auto --same-as eDP-1 --auto
	fi

	if [ "$POSITION" = "Left" ]; then
		xrandr --output HDMI-2 --auto --left-of eDP-1 --auto
	fi

	if [ "$POSITION" = "Right" ]; then
		xrandr --output HDMI-2 --auto --right-of eDP-1 --auto
	fi
fi

if [ "$MONITOR" = "External" ]; then
	xrandr --output HDMI-2 --auto --output eDP-1 --off
fi

if [ "$MONITOR" = "Default" ]; then
	xrandr --output eDP-1 --auto --output HDMI-2 --off
fi

feh --randomize --bg-scale $HOME/.local/share/wallpapers
