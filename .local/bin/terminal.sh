#!/bin/sh
SESSION_NAME="$(hostname -s)"

tmux has-session -t "$SESSION_NAME" 2> /dev/null
if [ "$?" -ne 0 ]; then
	tmux new-session -s "$SESSION_NAME" -d
fi

pgrep -x st > /dev/null
if [ "$?" -eq 0 ]; then
	tmux switch-client -t "$SESSION_NAME"
	xdo activate -n "st-256color"
	exit 0
fi

st -e tmux attach-session -t "$SESSION_NAME"
