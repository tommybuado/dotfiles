#!/bin/sh
COMMAND=$1

case "$COMMAND" in
	toggle)
		wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
		;;
	down)
		wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
		;;
	up)
		wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
		;;
esac
