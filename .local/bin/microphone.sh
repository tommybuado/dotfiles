#!/bin/sh
send_notification () {
	STATUS="$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | \
		awk -F ' ' '{print $3}')"
	VOLUME="$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | \
		awk -F ' ' '{print $2 * 100}')"

	if [ ! -z "$STATUS" ] && [ "$STATUS" = "[MUTED]" ]; then
		dunstify -i $HOME/.local/share/icons/dunst/microphone-off.png \
			-h string:x-dunst-stack-tag:microphone "Microphone OFF"
	else
		dunstify -i $HOME/.local/share/icons/dunst/microphone.png \
			-h string:x-dunst-stack-tag:microphone \
			-h int:value:$VOLUME "Microphone Control"
	fi
}

COMMAND=$1

case "$COMMAND" in
	toggle)
		wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
		send_notification
		;;
	down)
		wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 5%-
		send_notification
		;;
	up)
		wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 5%+
		send_notification
		;;
esac
