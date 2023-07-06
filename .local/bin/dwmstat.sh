#!/bin/sh
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
	xsetroot -name " $(print_connection)  $(print_date) "
	sleep 1
done
