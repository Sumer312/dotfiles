#!/bin/sh

for i in $(ps aux | awk '/autostart.sh/' | awk '/\/bin\/sh/{print $2}')
do
  if [ "$i" -eq "$$" ]; then
    continue
  fi
  kill -9 "$i"
done

for i in $(ps aux | awk '/status.sh/' | awk '/\/bin\/sh/{print $2}')
do
  kill -9 "$i"
done

dunst &
/home/sumer/Documents/bashScripts/startupSound.sh &
/home/sumer/Documents/bashScripts/displayScript.sh &
/home/sumer/Documents/bashScripts/touchpad.sh &
/home/sumer/Documents/bashScripts/status.sh &
xautolock -time 8 -locker /home/sumer/Documents/bashScripts/lock.sh -notify 20 -notifier /home/sumer/Documents/bashScripts/lockNotification.sh &
nitrogen --set-zoom-fill --random /home/sumer/Pictures/Wallpapers/ 
compton --config /home/sumer/.config/compton/compton.conf
