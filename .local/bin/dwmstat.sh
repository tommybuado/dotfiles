#!/bin/sh
print_date () {
	echo "^c#bb88dd^^d^ $(date '+%a %b %d %I:%M %p')"
}

while true; do
	xsetroot -name " $(print_date) "
	sleep 1s
done
