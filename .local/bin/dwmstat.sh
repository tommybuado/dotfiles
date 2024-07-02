#!/bin/sh
print_date () {
	echo -e "^c#4eb4fa^^d^ $(date '+%a %b %d %I:%M %p')"
}

while true; do
	xsetroot -name " $(print_date) "
	sleep 1s
done
