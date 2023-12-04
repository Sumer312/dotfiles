#!/bin/bash

run(){
   rofi -show run
}

applications(){
   rofi -show drun
}

quit(){
   rofi -show power-menu -modi power-menu:rofi-power-menu
}

network(){
  rofi-wifi-menu
}

while getopts 'raqi' OPTION; do
  case "${OPTION}" in
    r) run
      ;;
    a) applications
      ;;
    q) quit
      ;;
    i) network
      ;;
  esac
done

