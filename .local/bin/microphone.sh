#!/bin/sh
DEFAULT_SOURCE="@DEFAULT_AUDIO_SOURCE@"

COMMAND=$1

case $COMMAND in
	toggle)
		wpctl set-mute $DEFAULT_SOURCE toggle
		;;
	down)
		wpctl set-volume $DEFAULT_SOURCE 5%-
		;;
	up)
		wpctl set-volume $DEFAULT_SOURCE 5%+
		;;
esac
