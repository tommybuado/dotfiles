#!/bin/sh
picom --config $HOME/.config/picom/picom.conf &
redshift -c $HOME/.config/redshift/redshift.conf &
/usr/libexec/pipewire-launcher
