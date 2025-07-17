#!/bin/sh

run(){
   rofi -show run
}

drun(){
   rofi -show drun -show-icons
}

quit(){
  /home/sumer/shellScripts/rofiPower.sh
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

