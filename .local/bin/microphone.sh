#!/bin/sh
COMMAND=$1

case "$COMMAND" in
	toggle)
		wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
		;;
	down)
		wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 5%-
		;;
	up)
		wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 5%+
		;;
esac
