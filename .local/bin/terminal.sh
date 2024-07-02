#!/bin/sh
DEFAULT_SESSION="$(echo $HOSTNAME | sed -e 's/\./\_/g')"

tmux has-session -t $DEFAULT_SESSION > /dev/null
if [ "$?" -ne 0 ]; then
	tmux new-session -s $DEFAULT_SESSION -d
fi

pgrep -x st > /dev/null
if [ "$?" -eq 0 ]; then
	tmux switch-client -t $DEFAULT_SESSION
	xdo activate -n "st-256color"
	exit 0
fi

st -e tmux attach-session -t $DEFAULT_SESSION
