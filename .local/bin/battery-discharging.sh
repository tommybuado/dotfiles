#!/bin/sh
send_notification () {
	dunstify -i $HOME/.local/share/icons/dunst/battery-discharging.png \
		-h string:x-dunst-stack-tag:battery-discharging "Battery Discharging"
}

send_notification
