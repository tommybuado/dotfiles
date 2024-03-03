#!/bin/sh
send_notification () {
	dunstify -i $HOME/.local/share/icons/dunst/adapter-unplugged.png \
		-h string:x-dunst-stack-tag:adapter-unplugged "Adapter Unplugged"
}

send_notification
