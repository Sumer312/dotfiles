#!/bin/bash
 
if [ -n $(xrandr | grep "HDMI-A-0 disconnected") ]
then
i3lock -i ~/Pictures/Wallpapers/debianLockScreen.png
else
i3lock -i ~/Pictures/Wallpapers/debianWallpaper.png
fi
 
