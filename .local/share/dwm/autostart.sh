#!/bin/sh
pgrep -x dwmstat.sh > /dev/null
if [ "$?" -ne 0 ]; then
	dwmstat.sh 2>&1 > /dev/null &
fi

# start pipewire
/usr/libexec/pipewire-launcher
