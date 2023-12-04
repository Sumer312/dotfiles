#!/bin/bash

/home/sumer/Documents/bashScripts/startupSound.sh &
/home/sumer/Documents/bashScripts/displayScript.sh &
/home/sumer/Documents/bashScripts/touchpad.sh &
/home/sumer/Documents/bashScripts/dwmStatusBar.sh &
xautolock -time 8 -locker /home/sumer/Documents/bashScripts/lock.sh &
nitrogen --set-zoom-fill --random ~/Pictures/Wallpapers/ 
compton --config ~/.config/compton/compton.conf

wait "$(ps aux | awk '$11 ~ /dwm/'  | awk '{print $2}')"
# kill -9 "$(ps aux | awk '$12 ~ /autostart.sh/' | awk '{print $2}')"
kill -9 "$(ps aux | awk '$12 ~ /dwmStatusBar.sh/' | awk '{print $2}')"

