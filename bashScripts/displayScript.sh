#!/bin/bash

setxkbmap -option "ctrl:swapcaps"
if [[ -z $(xrandr | grep "HDMI-A-0 disconnected") ]]; then
	xrandr --output HDMI-A-0 --mode 1360x768 --rate 60 --primary && xrandr --output eDP --off
else
	xrandr --output eDP --auto --mode 1920x1080 --primary && xrandr --output HDMI-A-0 --off
fi
