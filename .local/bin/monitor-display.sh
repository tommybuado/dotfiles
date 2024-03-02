#!/bin/sh
MONITOR="$(echo -e 'External\nThinkPad LCD' | \
	dmenu -nf '#d0d0d0' -sf '#4eb4fa' $@)"

if [ -z "$MONITOR" ]; then
	exit 0
fi

if [ "$MONITOR" = "External" ]; then
	POSITION="$(echo -e 'Left\nRight\nSame As' | dmenu \
		-nf '#d0d0d0' -sf '#4eb4fa' $@)"

	if [ "$POSITION" = "Left" ]; then
		xrandr --output HDMI-2 --auto \
			--left-of eDP-1 --auto
	fi

	if [ "$POSITION" = "Right" ]; then
		xrandr --output HDMI-2 --auto \
			--right-of eDP-1 --auto
	fi

	if [ "$POSITION" = "Same As" ]; then
		xrandr --output HDMI-2 --auto \
			--same-as eDP-1 --auto
	fi
fi

if [ "$MONITOR" = "ThinkPad LCD" ]; then
	xrandr --output eDP-1 --auto \
		--output HDMI-2 --off
fi

feh --randomize --bg-scale $HOME/.local/share/wallpapers
