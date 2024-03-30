#!/bin/sh

export PASSWORD_STORE_DIR=/home/sumer/.password-store
export PASSWORD_STORE_CLIP_TIME=25
pw_list=$(find -L "$PASSWORD_STORE_DIR" -name '*.gpg')
gpg_file=$(printf "%s\n" "$pw_list" | awk -F "$PASSWORD_STORE_DIR/" '{print $2}' | awk -F ".gpg" '{print $1}')
selected_option=$(printf "%s\n" "$gpg_file" | rofi -dmenu -i -p " Passwords")
if [ "$selected_option" = "" ]; then
  dunstify -u low "  not in clip" -t 2000
  exit 130
fi
pass show -c "$selected_option"
if [ $? -eq 2 ]; then
  dunstify -u low "  not in clip" -t 2000
  exit 2
else
  dunstify  "  in clip" "will be cleared in 25s" -t 2000
fi
exit 0
