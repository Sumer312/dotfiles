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
mpv --no-video /home/sumer/Music/startup/psp_game_startup.mp3 &
xautolock -time 8 -locker /home/sumer/shellScripts/lock.sh -notify 20 -notifier /home/sumer/shellScripts/lockNotification.sh &
/home/sumer/shellScripts/displayScript.sh &
/home/sumer/shellScripts/touchpad.sh &
/home/sumer/shellScripts/status.sh &
nitrogen --set-zoom-fill --random /home/sumer/Pictures/Wallpapers/ 
compton --config /home/sumer/.config/compton/compton.conf
