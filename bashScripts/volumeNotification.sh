#!/bin/sh

send_notification() {
  volume="$(pamixer --get-volume)"
  if $(pamixer --get-mute); then
    dunstify -a "changeVolume" -u normal -r 9992 -h int:value:"$volume" "󰕾 Volume:${volume}%" "󰖁 Muted" -t 2000
  else 
    dunstify -a "changeVolume" -u normal -r 9992 -h int:value:"$volume" "󰕾 Volume:${volume}%" -t 2000
  fi
}

case $1 in
  up)
    pamixer -i 5 
    send_notification $1
    ;;
  down)
    pamixer -d 5 
    send_notification $1
    ;;
  mute)
    pamixer -t
    if $(pamixer --get-mute); then
      dunstify -a "changeVolume" -u critical -r 9992  "󰖁 Muted" -t 2000
    else 
      send_notification up
    fi
    ;;
esac
