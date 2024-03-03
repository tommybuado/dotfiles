#!/bin/sh
SETTING="$(echo -e 'Power Management\nTouchPad' | \
	dmenu -nf '#d0d0d0' -sf '#ffba68' $@)"

if [ -z "$SETTING" ]; then
	exit 0
fi

if [ "$SETTING" = "Power Management" ]; then
	ACTION="$(echo -e 'Poweroff\nReboot' | \
		dmenu -nf '#d0d0d0' -sf '#80ff00' $@)"

	if [ "$ACTION" = "Poweroff" ]; then
		doas /sbin/poweroff
		exit 0
	fi

	if [ "$ACTION" = "Reboot" ]; then
		doas /sbin/reboot
		exit 0
	fi
fi

if [ "$SETTING" = "TouchPad" ]; then
	ACTION="$(echo -e 'Enable\nDisable' | \
		dmenu -nf '#d0d0d0' -sf '#ffba68' $@)"

	TOUCHPAD="SynPS/2 Synaptics TouchPad"

	if [ "$ACTION" = "Enable" ]; then
		xinput enable "$TOUCHPAD"
		exit 0
	fi

	if [ "$ACTION" = "Disable" ]; then
		xinput disable "$TOUCHPAD"
		exit 0
	fi
fi
