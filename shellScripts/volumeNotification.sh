#!/bin/sh

icon_mute=" "
icon_volume=" "
# headphones_connection=$(grep -A4 -ri "Headphone Playback Switch" /proc/asound/card*/* | grep "Amp-Out vals.*0x00 0x00")
notify() {
	volume="$(pamixer --get-volume)"
	if $(pamixer --get-mute); then
		dunstify -a "changeVolume" -u normal -r 9992 -h int:value:"$volume" "${icon_mute} Muted" "${icon_volume} Volume:${volume}%" -t 2000
	else
		dunstify -a "changeVolume" -u normal -r 9992 -h int:value:"$volume" "${icon_volume} Volume:${volume}%" -t 2000
	fi
}

case $1 in
up)
	pamixer -i 5
	notify
	;;
down)
	pamixer -d 5
	notify
	;;
mute)
	pamixer -t
	if $(pamixer --get-mute); then
		dunstify -a "changeVolume" -u critical -r 9992 "${icon_mute} Muted" -t 2000
	else
		notify
	fi
	;;
esac
