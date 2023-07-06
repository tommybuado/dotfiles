#!/bin/sh
VIRT_MACHINE="$(virsh list --name --all | sed '/^\s*$/d' | \
	dmenu -nf '#d0d0d0' -sf '#bb88dd' $@)"

if [ -z "$VIRT_MACHINE" ]; then
	exit 0
fi

virsh list --name --state-shutoff | grep $VIRT_MACHINE > /dev/null
if [ "$?" -eq 0 ]; then
	virsh start $VIRT_MACHINE
fi

remote-viewer --title "MS Windows 10 - Pro" spice://127.0.0.1:5900
