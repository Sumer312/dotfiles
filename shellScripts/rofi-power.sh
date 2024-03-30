#!/bin/sh

set -e
set -u

texts[lockscreen]="lock screen"
texts[logout]="log out"
texts[suspend]="suspend"
texts[reboot]="reboot"
texts[shutdown]="shut down"

declare -A icons
icons[lockscreen]=""
icons[logout]="󰗽"
icons[suspend]="󰒲"
icons[shutdown]="󰐥"
icons[cancel]=""
icons[reboot]="󰜉"

declare -A actions
actions[lockscreen]="xautolock -locknow"
actions[logout]="loginctl terminate-session ${XDG_SESSION_ID-}"
actions[suspend]="systemctl suspend"
actions[reboot]="systemctl reboot"
actions[shutdown]="systemctl poweroff"

selected_option=$(printf "texts" | uniq -u | rofi -dmenu -i -selected-row 0 -p "  SSID" )
