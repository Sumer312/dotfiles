#!/bin/bash

function send_notification() {
  brightness="$(brightnessctl g)"
  brightness100=$(echo "scale=2; ($brightness/255) * 100" | bc)
  dunstify -a "changeBrightness" -u normal -r 9993 -h int:value:"$brightness100" "󰃟 Brightness:${brightness}" -t 2000
}

case $1 in
  up)
    brightnessctl set +10%
    send_notification $1
    ;;
  down)
    brightnessctl set 10-%
    send_notification $1
    ;;
esac
