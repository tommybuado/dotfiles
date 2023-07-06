#!/bin/sh
tmux has-session -t "$HOSTNAME" 2> /dev/null
if [ "$?" -ne 0 ]; then
	tmux new-session -s "$HOSTNAME" -d
fi

pgrep -x st > /dev/null
if [ "$?" -eq 0 ]; then
	xdo activate -n "st-256color"

	# switch to default tmux client
	tmux switch-client -t "$HOSTNAME"
	exit 0
fi

st -e tmux attach-session -t "$HOSTNAME"
