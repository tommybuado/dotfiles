#!/bin/sh
send_notification () {
	BRIGHTNESS="$(brillo -b)"
	dunstify -i $HOME/.local/share/icons/dunst/brightness.png \
		-h string:x-dunst-stack-tag:brightness \
		-h int:value:$BRIGHTNESS "Brightness Control"
}

COMMAND=$1

case $COMMAND in
	down)
		brillo -U 5 > /dev/null
		send_notification
		;;
	up)
		brillo -A 5 > /dev/null
		send_notification
		;;
esac
