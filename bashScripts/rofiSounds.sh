#!/bin/bash

audio="/home/sumer/Music/message-incoming-132126.mp3"

run(){
  mpv --no-video "$audio" & (sleep .05 && rofi -show run) &
}

applications(){
  mpv --no-video "$audio" & (sleep .05 && rofi -show drun) &
}

quit(){
  mpv --no-video "$audio" & (sleep .05 && rofi -show power-menu -modi power-menu:rofi-power-menu) &
}

while getopts 'raq' OPTION; do
  case "${OPTION}" in
    r) run
      ;;
    a) applications
      ;;
    q) quit
      ;;
  esac
done

wait -f
