#!/bin/sh

notify-send "Getting list of available Wi-Fi networks..."

wifi_list=$(nmcli --fields "SECURITY,SSID" device wifi list | sed 1d | sed 's/  */ /g' | sed -E "s/WPA*.?\S/ /g" | sed "s/^--/ /g" | sed "s/  //g" | sed "/--/d")
connected=$(nmcli --fields WIFI g)

if echo "$connected" | grep -q "disabled"; then
  toggle="󰤨 Enable Wi-Fi"
else
  toggle="󰤮 Disable Wi-Fi"
fi

selected_option=$(printf "$toggle\n$wifi_list" | uniq -u | rofi -dmenu -i -selected-row 0 -p "  SSID" )
substring=$(printf "%s" "$selected_option" | cut -c 4-)
chosen_id=$(printf "%s" "$substring" | xargs)

if [ "$selected_option" = "" ]; then
  exit
elif echo "$selected_option" | grep -q "󰤮 Disable Wi-Fi"; then
  nmcli radio wifi off
elif echo "$selected_option" | grep -q "󰤨 Enable Wi-Fi"; then
  nmcli radio wifi on
else 
  success_message="You are now connected to the Wi-Fi network \"$chosen_id\"."
  secure_connection=$(echo "$selected_option" | grep "")
  if [ -n secure_connection ]; then
    wifi_password=$(rofi -dmenu -p "Password: ")
  fi
  if nmcli device wifi connect "$chosen_id" password "$wifi_password" | grep "successfully"; then
    notify-send "Connection Established" "$success_message"
  else
    notify-send -u critical "Connection activation failed" 
  fi
fi
