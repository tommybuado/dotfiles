#!/bin/sh
feh --randomize --bg-scale $HOME/.local/share/wallpapers

pgrep -x dwmstat.sh > /dev/null
if [ "$?" -ne 0 ]; then
	$HOME/.local/bin/dwmstat.sh 2>&1 > /dev/null &
fi

/usr/libexec/pipewire-launcher
