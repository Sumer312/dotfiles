#!/bin/sh

# betterlockscreen -l

if [ -z "$(xrandr | grep "HDMI-A-0 disconnected")" ]; then
  i3lock -nei ~/Pictures/debianLockScreen.png
else
  i3lock -nei ~/Pictures/Wallpapers/ornstein-wallpapers.png
fi
