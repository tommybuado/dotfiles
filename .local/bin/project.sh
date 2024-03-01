#!/bin/sh
PROJECT_NAME="$(find $HOME/Desktop/Projects -type d -maxdepth 2 \
	-mindepth 2 | cut -d '/' -f7 | sort | dmenu $@)"

if [ -z "$PROJECT_NAME" ]; then
	exit 0
fi

PROJECT_DIR="$(find $HOME/Desktop/Projects -type d -maxdepth 2 \
	-mindepth 2 -iname $PROJECT_NAME)"

tmux has-session -t "$PROJECT_NAME" 2> /dev/null
if [ "$?" -ne 0 ]; then
	tmux new-session -s "$PROJECT_NAME" -c "$PROJECT_DIR" -d
fi

pgrep -x st > /dev/null
if [ "$?" -eq 0 ]; then
	tmux switch-client -t "$PROJECT_NAME"
	xdo activate -n "st-256color"
	exit 0
fi

st -e tmux attach-session -t "$PROJECT_NAME"
