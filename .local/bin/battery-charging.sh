#!/bin/sh
send_notification () {
	dunstify -i $HOME/.local/share/icons/dunst/battery-charging.png \
		-h string:x-dunst-stack-tag:battery-charging "Battery Charging"
}

send_notification
