#!/bin/sh

run(){
   rofi -show run
}

drun(){
   rofi -show drun
}

quit(){
   rofi -show power-menu -modi power-menu:rofi-power-menu
}

network(){
  rofi-wifi-menu
}

pass(){
  rofi-pass
}


while getopts 'rdqnp' OPTION; do
  case "${OPTION}" in
    r) run
      ;;
    d) drun
      ;;
    q) quit
      ;;
    n) network
      ;;
    p) pass
      ;;
  esac
done

