#!/bin/sh
send_notification () {
	STATUS="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ |\
		awk -F ' ' '{print $3}')"
	VOLUME="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ |\
		awk -F ' ' '{print $2 * 100}')"

	if [ ! -z "$STATUS" ] && [ "$STATUS" = "[MUTED]" ]; then
		dunstify -i $HOME/.local/share/icons/dunst/speaker-off.png \
			-h string:x-dunst-stack-tag:speaker "Speaker OFF"
	else
		dunstify -i $HOME/.local/share/icons/dunst/speaker.png \
			-h string:x-dunst-stack-tag:speaker \
			-h int:value:$VOLUME "Speaker Control"
	fi
}

COMMAND=$1

case "$COMMAND" in
	toggle)
		wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
		send_notification
		;;
	down)
		wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
		send_notification
		;;
	up)
		wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
		send_notification
		;;
esac
