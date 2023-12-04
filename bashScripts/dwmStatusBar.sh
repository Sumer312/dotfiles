#!/bin/bash

while :; do
  dwm -s "  $(date +"%H:%M")   $(date +"%a %d-%m-%y")   $(nmcli | grep wlo1: | awk '{print $4}')   $(acpi -t | awk  '{print $4}') 󰔄  󱊣$(acpi | awk -F"," '{print $2}') "
sleep 1m
done
