#!/bin/sh
print_connection () {
	ETHERNET="$(head -n 1 /sys/class/net/eth0/operstate)"
	if [ "$ETHERNET" = "up" ]; then
		echo "^c#80ff00^^d^"
	fi

	WIFI="$(head -n 1 /sys/class/net/wlan0/operstate)"
	if [ "$WIFI" = "up" ]; then
		echo "^c#80ff00^^d^"
	fi
}

print_date () {
	echo "^c#bb88dd^^d^ $(date '+%a %b %d %I:%M %p')"
}

while true; do
	xsetroot -name " $(print_connection)  $(print_date) "
	sleep 1s
done
