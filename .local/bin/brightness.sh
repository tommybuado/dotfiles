#!/bin/sh
COMMAND=$1

case "$COMMAND" in
	down)
		brillo -U 5
		;;
	up)
		brillo -A 5
		;;
esac
