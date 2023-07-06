#!/bin/sh
print_weather () {
	if [ ! -d "$HOME/.cache/wttr.in/" ]; then
		mkdir -p $HOME/.cache/wttr.in/

		if [ ! -f "$HOME/.cache/wttr.in/location" ]; then
			touch $HOME/.cache/wttr.in/location
		fi
	fi

	LOCATION="$(head -n 1 "$HOME/.cache/wttr.in/location" | tr -d '\n')"
	if [ -z "$LOCATION" ]; then
		echo "^c#ff0090^^d^"
		exit 0
	fi

	WTTR="$(curl -sf wttr.in/$LOCATION?format=2 | awk '{print $1 " " $2}')"

	if [ ! -z "$WTTR" ]; then
		echo "^c#d0d0d0^$WTTR^d^"
		exit 0
	fi
}

print_connection () {
	ETHSTAT="$(cat /sys/class/net/eth0/operstate)"
	if [ ! -z "$ETHSTAT" ] && [ "$ETHSTAT" = "up" ]; then
		echo "^c#80ff00^^d^"
		exit 0
	fi

	WLANSTAT="$(cat /sys/class/net/wlan0/operstate)"
	if [ ! -z "$WLANSTAT" ] && [ "$WLANSTAT" = "up" ]; then
		echo "^c#80ff00^^d^"
		exit 0
	fi
}

print_date () {
	echo "^c#bb88dd^^d^ $(date '+%a %b %d %I:%M %p')"
}

while true; do
	xsetroot -name " $(print_weather)  $(print_connection)  $(print_date) "
	sleep 1
done
