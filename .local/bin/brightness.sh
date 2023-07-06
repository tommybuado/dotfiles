#!/bin/sh
COMMAND=$1

case $COMMAND in
	down)
		brillo -U 5 > /dev/null
		;;
	up)
		brillo -A 5 > /dev/null
		;;
esac
