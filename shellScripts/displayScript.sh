#!/bin/sh

while getopts 'hd' OPTION; do
	case "${OPTION}" in
	h)
		xrandr --output eDP --off --output HDMI-A-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal
		exit 0
		;;
	d)
		xrandr --output eDP --primary --mode 1920x1080 --pos 2318x0 --rotate normal --output HDMI-A-0 --off
		exit 0
		;;
	esac
done
