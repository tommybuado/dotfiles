#!/bin/sh
BAT0_CAPACITY="$(cat /sys/class/power_supply/BAT0/capacity)"
BAT1_CAPACITY="$(cat /sys/class/power_supply/BAT1/capacity)"

send_notification () {
	BAT0_STAT="$(cat /sys/class/power_supply/BAT0/status)"
	BAT1_STAT="$(cat /sys/class/power_supply/BAT1/status)"

	if [ "$BAT0_STAT" = "Full" ] && [ "$BAT1_STAT" = "Full" ]; then
		CAPACITY="$((($BAT0_CAPACITY + $BAT1_CAPACITY) / 2 ))"
		if [ "$CAPACITY" -eq 100 ]; then
			dunstify -i $HOME/.local/share/icons/dunst/battery-full.png \
				-h string:x-dunst-stack-tag:battery-full "Battery Full!"
		fi
	fi
}

send_notification
