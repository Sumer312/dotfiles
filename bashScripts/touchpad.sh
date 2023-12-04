#!/bin/bash

xinput set-prop "ELAN071A:00 04F3:30FD Touchpad" "libinput Tapping Enabled" 1
for i in $(echo $(xinput | grep -i Touchpad))
do
  if [[ -n $(echo "$i" | grep id) ]];then
    arg1=$(echo "$i" | grep id | awk -F "=" '{print $2}')
    echo "$arg1"
    temp=$(xinput list-props "$arg1" | awk '/libinput Natural Scrolling Enabled [(]/{print $0}')
    arg2=$(echo "$temp" | awk -F'[()]' '{print $2}')
    xinput set-prop "$arg1" "$arg2" 1
    break 
  fi
done

