#!/bin/sh
if [ "$#" -ne 1 ]; then
	echo -e "\e[1;31mMissing valid argument."
	exit 1
fi

INTERFACE=$1

if [ "$INTERFACE" != "eth0" ] && [ "$INTERFACE" != "wlan0" ]; then
	echo -e "\e[1;31mInvalid argument."
	exit 1
fi

if [ "$INTERFACE" = "eth0" ]; then
	sed -i 's/wlan/eth/g' /etc/network/interfaces

	STATUS="$(rc-status -f ini | grep wpa_supplicant | awk '{print $3}')"
	if [ "$STATUS" != "stopped" ]; then
		rc-service wpa_supplicant stop
	fi
fi

if [ "$INTERFACE" = "wlan0" ]; then
	sed -i 's/eth/wlan/g' /etc/network/interfaces
	rc-service wpa_supplicant start
fi

rc-service networking restart
