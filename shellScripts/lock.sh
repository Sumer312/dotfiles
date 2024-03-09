#!/bin/sh

if [ -z "$(xrandr | grep "HDMI-A-0 disconnected")" ]; then
  i3lock -n -e -i ~/Pictures/debianLockScreen.png
else
  i3lock -n -e -i ~/Downloads/debian-dragon-1920x1080.png
fi
