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

print_due_task () {
	TASKS="$(task +DUE | tail -n 1 | cut -d ' ' -f1)"
	if [ -z "$TASKS" ]; then
		echo "^c#ff0090^^d^ ^c#d0d0d0^0^d^"
		exit 0
	fi

	echo "^c#ff0090^^d^ ^c#d0d0d0^$TASKS^d^"
}

print_work_task () {
	TASKS="$(task project:Work | tail -n 1 | cut -d ' ' -f1)"
	if [ -z "$TASKS" ]; then
		echo "^c#4eb4fa^^d^ ^c#d0d0d0^0^d^"
		exit 0
	fi

	echo "^c#4eb4fa^^d^ ^c#d0d0d0^$TASKS^d^"
}

print_personal_task () {
	TASKS="$(task project:Personal | tail -n 1 | cut -d ' ' -f1)"
	if [ -z "$TASKS" ]; then
		echo "^c#7f7f7f^^d^ ^c#d0d0d0^0^d^"
		exit 0
	fi

	echo "^c#7f7f7f^^d^ ^c#d0d0d0^$TASKS^d^"
}

print_mail () {
	MESSAGES=0

	MAILBOXES="tommybuado@gmail.com penncycount@gmail.com"
	for mail in $MAILBOXES; do
		MESSAGE="$(ls $HOME/.local/share/mail/$mail/INBOX/new | wc -l)"
		MESSAGES="$(($MESSAGES + $MESSAGE))"
	done

	if [ "$MESSAGES" -ne 0 ]; then
		echo "^c#ff0090^^d^ $MESSAGES"
		exit 0
	fi

	echo "^c#d0d0d0^^d^ $MESSAGES"
}

print_battery () {
	CAPACITY="$(cat /sys/class/power_supply/$1/capacity)"
	STATUS="$(cat /sys/class/power_supply/$1/status)"

	if [ "$STATUS" = "Full" ]; then
		echo "^c#80ff00^^d^ $CAPACITY%"
		exit 0
	fi

	if [ "$STATUS" = "Charging" ]; then
		echo "^c#ffba68^^d^ $CAPACITY%"
		exit 0
	fi

	if [ "$STATUS" = "Not charging" ]; then
		echo "^c#7f7f7f^^d^ $CAPACITY%"
		exit 0
	fi

	if [ "$CAPACITY" -gt 95 ]; then
		if [ "$STATUS" = "Discharging" ]; then
			echo "^c#80ff00^^d^ $CAPACITY%"
			exit 0
		fi
	elif [ "$CAPACITY" -gt 75 ]; then
		if [ "$STATUS" = "Discharging" ]; then
			echo "^c#80ff00^^d^ $CAPACITY%"
			exit 0
		fi
	elif [ "$CAPACITY" -gt 50 ]; then
		if [ "$STATUS" = "Discharging" ]; then
			echo "^c#ffba68^^d^ $CAPACITY%"
			exit 0
		fi
	elif [ "$CAPACITY" -gt 25 ]; then
		if [ "$STATUS" = "Discharging" ]; then
			echo "^c#ffba68^^d^ $CAPACITY%"
			exit 0
		fi
	elif [ "$CAPACITY" -gt 10 ]; then
		if [ "$STATUS" = "Discharging" ]; then
			echo "^c#ff0090^^d^ $CAPACITY%"
			exit 0
		fi
	else
		if [ "$STATUS" = "Discharging" ]; then
			echo "^c#ff0090^^d^ $CAPACITY%"
			exit 0
		fi
	fi
}

print_date () {
	echo "^c#bb88dd^^d^ $(date '+%a %b %d %I:%M %p')"
}

while true; do
	STATUSES=" $(print_weather)  $(print_connection)  $(print_due_task)\
		$(print_work_task)  $(print_personal_task)  $(print_mail)\
		$(print_battery BAT1)  $(print_battery BAT0)  $(print_date) "

	xsetroot -name "$STATUSES"
	sleep 1
done
