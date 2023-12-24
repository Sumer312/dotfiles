#!/bin/bash

while :; do
  if [[ -z "$(acpi | grep Charging)" ]] then
    dwm -s "  $(date +"%H:%M")   $(date +"%a %d-%m-%y")   $(nmcli | grep wlo1: | awk '{print $4}')   $(acpi -t | awk  '{print $4}') 󰔄  󱊣$(acpi | awk -F"," '{print $2}') "
  else 
    dwm -s "  $(date +"%H:%M")   $(date +"%a %d-%m-%y")   $(nmcli | grep wlo1: | awk '{print $4}')   $(acpi -t | awk  '{print $4}') 󰔄  󰂄$(acpi | awk -F"," '{print $2}') "
  fi
  sleep 30s
done
