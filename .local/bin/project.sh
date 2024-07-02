#!/bin/sh
PROJECTS_DIR="$HOME/Desktop/Projects"

WORKSPACE="$(find $PROJECTS_DIR -type d -maxdepth 1 -mindepth 1 | cut -d / -f6 | sort | dmenu $@)"
PROJECT="$(find $PROJECTS_DIR/$WORKSPACE -type d -maxdepth 1 -mindepth 1 | cut -d / -f7 | sort | dmenu $@)"

PROJECT_DIR="$HOME/Desktop/Projects/$WORKSPACE/$PROJECT"
PROJECT_SESSION="$(echo $PROJECT | sed -e 's/\./\_/g')"

tmux has-session -t $PROJECT_SESSION > /dev/null
if [ "$?" -ne 0 ]; then
	tmux new-session -s $PROJECT_SESSION -c $PROJECT_DIR -d
fi

pidof -s /usr/bin/st > /dev/null
if [ "$?" -eq 0 ]; then
	tmux switch-client -t $PROJECT_SESSION
	xdo activate -n "st-256color"
	exit 0
fi

st -e tmux attach-session -t $PROJECT_SESSION
