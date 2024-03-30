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
  /home/sumer/shellScripts/rofiWifiMenu.sh
}

pass(){
  /home/sumer/shellScripts/rofiPass.sh
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

