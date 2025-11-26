#!/bin/sh

for i in $(ps aux | awk '/status.sh/' | awk '/\/bin\/sh/{print $2}')
do
  kill -9 "$i"
done

for i in $(ps aux | awk '/autostart.sh/' | awk '/\/bin\/sh/{print $2}')
do
  if [ "$i" -eq "$$" ]; then
    continue
  fi
  kill -9 "$i"
done

setxkbmap -option "ctrl:swapcaps"
dunst &
lxpolkit &
/home/sumer/shellScripts/startupSound.sh &
/home/sumer/shellScripts/displayScript.sh &
/home/sumer/shellScripts/touchpad.sh &
/home/sumer/shellScripts/status.sh &
/home/sumer/shellScripts/gtk2theme.sh &
xautolock -time 8 -locker /home/sumer/shellScripts/lock.sh -notify 20 -notifier /home/sumer/shellScripts/lockNotification.sh &
nitrogen --set-zoom-fill --random /home/sumer/Pictures/Wallpapers/ 
picom --config /home/sumer/.config/picom/picom.conf
