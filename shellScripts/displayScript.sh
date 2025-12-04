#!/bin/sh

hdmi() {
	xrandr --output eDP --off --output HDMI-A-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal
}
edp() {
	xrandr --output eDP --primary --mode 1920x1080 --pos 2318x0 --rotate normal --output HDMI-A-0 --off
}

while getopts 'hdb' OPTION; do
	case "${OPTION}" in
	h)
		hdmi
		;;
	d)
		edp
		;;
	b)
		if [ -n "$(xrandr | grep "HDMI-A-0 connected")" ]; then
			hdmi
		fi
		;;
	esac
done
