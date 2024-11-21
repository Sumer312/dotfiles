#!/bin/sh

if [ -z "$(xrandr | grep "HDMI-A-0 disconnected")" ]; then
	i3lock -nei ~/Pictures/Wallpapers/860180.png
else
	i3lock -nei ~/Pictures/Wallpapers/860180.png
fi
