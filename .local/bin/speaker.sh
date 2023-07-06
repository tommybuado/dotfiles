#!/bin/sh
DEFAULT_SINK="@DEFAULT_AUDIO_SINK@"

COMMAND=$1

case $COMMAND in
	toggle)
		wpctl set-mute $DEFAULT_SINK toggle
		;;
	down)
		wpctl set-volume $DEFAULT_SINK 5%-
		;;
	up)
		wpctl set-volume $DEFAULT_SINK 5%+
		;;
esac
