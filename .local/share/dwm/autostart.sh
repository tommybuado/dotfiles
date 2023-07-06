#!/bin/sh
feh --randomize --bg-scale $HOME/.local/share/wallpapers
picom --config $HOME/.config/picom/picom.conf &
redshift -c $HOME/.config/redshift/redshift.conf &

pgrep -x dwmstat.sh > /dev/null
if [ "$?" -ne 0 ]; then
	dwmstat.sh 2>&1 > /dev/null &
fi

# start pipewire
/usr/libexec/pipewire-launcher
