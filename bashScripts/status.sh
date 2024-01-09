#!/bin/bash

function send_notification() {
  dunstify -a "batteryNotification" -u critical -r 9994  "󰂃 Plug in charger" -t 2000 &
  mpv --no-video /home/sumer/Music/message-incoming-132126.mp3 &
  wait
}

while :; do
  if [[ -z $(nmcli | grep wlo1: | awk '{print $4}') ]] then
    if [[ -z $(acpi | grep Charging) ]] then
      if [[ $(acpi | awk -F "%" '{print $1}' | awk -F "," '{print $2}') -lt '20' ]]; then
        dwm -s "  $(date +"%H:%M")   $(date +"%a %d-%m-%y")  󰤭 $(nmcli | grep wlo1: | awk '{print $2}')   $(acpi -t | awk  '{print $4}') 󰔄  󰂃$(acpi | awk -F"," '{print $2}') "
        send_notification 
      else 
        dwm -s "  $(date +"%H:%M")   $(date +"%a %d-%m-%y")  󰤭 $(nmcli | grep wlo1: | awk '{print $2}')   $(acpi -t | awk  '{print $4}') 󰔄  󱊣$(acpi | awk -F"," '{print $2}') "
      fi
    else 
      dwm -s "  $(date +"%H:%M")   $(date +"%a %d-%m-%y")  󰤭 $(nmcli | grep wlo1: | awk '{print $2}')   $(acpi -t | awk  '{print $4}') 󰔄  󰂄$(acpi | awk -F"," '{print $2}') "
    fi
  else 
    if [[ -z $(acpi | grep Charging) ]] then
      if [[ $(acpi | awk -F "%" '{print $1}' | awk -F "," '{print $2}') -lt '20' ]]; then
        dwm -s "  $(date +"%H:%M")   $(date +"%a %d-%m-%y")  󰤨 $(nmcli | grep wlo1: | awk '{print $4}')   $(acpi -t | awk  '{print $4}') 󰔄  󰂃$(acpi | awk -F"," '{print $2}') "
        send_notification 
      else 
        dwm -s "  $(date +"%H:%M")   $(date +"%a %d-%m-%y")  󰤨 $(nmcli | grep wlo1: | awk '{print $4}')   $(acpi -t | awk  '{print $4}') 󰔄  󱊣$(acpi | awk -F"," '{print $2}') "
      fi
    else 
      dwm -s "  $(date +"%H:%M")   $(date +"%a %d-%m-%y")  󰤨 $(nmcli | grep wlo1: | awk '{print $4}')   $(acpi -t | awk  '{print $4}') 󰔄  󰂄$(acpi | awk -F"," '{print $2}') "
    fi
  fi
  sleep 30s
done
