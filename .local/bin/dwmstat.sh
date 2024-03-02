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

print_tasks_personal () {
	TASKS="$(grep 'Personal*' ~/.local/share/task/pending.data | wc -l)"
	echo "^c#bb88dd^^d^ $TASKS"
}

print_tasks_office () {
	TASKS="$(grep 'OFFICE*' ~/.local/share/task/pending.data | wc -l)"
	echo "^c#4eb4fa^^d^ $TASKS"
}

print_tasks_due () {
	TASKS="$(grep 'due:*' ~/.local/share/task/pending.data | wc -l)"
	echo "^c#ff0090^^d^ $TASKS"
}

print_date () {
	echo "^c#bb88dd^^d^ $(date '+%a %b %d %I:%M %p')"
}

while true; do
	STATUSES="$(print_connection)  $(print_tasks_personal)\
		$(print_tasks_office)  $(print_tasks_due)  $(print_date)"

	xsetroot -name " $STATUSES "
	sleep 1s
done
