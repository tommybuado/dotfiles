#!/bin/sh
PROJECT="$(ls $HOME/Desktop/Projects | \
	dmenu -nf '#d0d0d0' -sf '#80ff00' $@)"

if [ -z "$PROJECT" ]; then
	exit 0
fi

if [ ! -d "$HOME/Desktop/Projects/$PROJECT" ]; then
	mkdir -p $HOME/Desktop/Projects/$PROJECT
fi

tmux has-session -t "$PROJECT" 2> /dev/null
if [ "$?" -ne 0 ]; then
	tmux new-session -s "$PROJECT" -d \
		-c $HOME/Desktop/Projects/$PROJECT
fi

pgrep -x st > /dev/null
if [ "$?" -eq 0 ]; then
	xdo activate -n "st-256color"

	# switch to project's tmux client
	tmux switch-client -t "$PROJECT"
	exit 0
fi

st -e tmux attach-session -t "$PROJECT"
