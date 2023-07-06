#!/bin/sh
print_date () {
	echo "$(date '+%a %b %d %I:%M %p')"
}

while true; do
	xsetroot -name "$(print_date)"
	sleep 1
done
