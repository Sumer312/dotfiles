#!/bin/bash

if [[ -z $(xrandr | grep "HDMI-A-0 disconnected") ]];
then
i3lock -e --image ~/Pictures/debianLockScreen.png
else
i3lock -e --image ~/Pictures/Wallpapers/debianWallpaper.png 
fi
 
