#!/bin/sh

notify() {
	dunstify -a "batteryNotification" -u critical -r 9994 "󰂃 Plug in charger" -t 2000 &
	mpv --no-video /home/sumer/Music/message-incoming-132126.mp3 &
	wait
}

battery_check=$(upower -i $(upower -e | grep BAT) | grep -E "percentage" | awk '{print $2}' | awk -F "%" '{print $1}')
send_notification_at=19
if [ "$battery_check" -lt 20 ]; then
	send_notification_at="$battery_check"
fi

while :; do
	is_connected=$(nmcli | grep wlo1: | awk '{print $2}')
	wifi_name=$(nmcli | grep wlo1: | awk -F 'connected to' '{print $2}' | awk '{print $1}')
	is_charging=$(acpi | grep Charging)
	battery_check=$(upower -i $(upower -e | grep BAT) | grep -E "percentage" | awk '{print $2}' | awk -F "%" '{print $1}')

	var_time=$(date +"%H:%M")
	var_uptime=$(uptime | awk -F ',' '{print $1}' | awk -F 'up' '{print $2}' | xargs)
	var_date=$(date +"%a %d.%m.%y")
	var_temp=$(acpi -t | awk -F ',' '{print $2}' | awk -F 'degrees' '{print $1 $2}' | xargs)
	var_battery=$(upower -i $(upower -e | grep BAT) | grep -E "percentage" | awk '{print $2}')
	var_memory=$(free | awk '/Mem/ {printf "%.2f GiB", $3 / 1048576.0}')
	var_wifi=$wifi_name

	wifi_speed=$(awk 'NR==3 {print $4}' /proc/net/wireless | awk -F "." '{print $1}')

	icon_battery=" "
	icon_wifi="󰤨"
	icon_time=""
	icon_uptime=""
	icon_date="󰸗"
	icon_temp=" "
	icon_memory=" "

	if [ -n "$wifi_name" ]; then
		if [ "$wifi_speed" -ge -50 ]; then
			icon_wifi="󰤨"
		elif [ "$wifi_speed" -ge -60 ] && [ "$wifi_speed" -le -51 ]; then
			icon_wifi="󰤥"
		elif [ "$wifi_speed" -ge -70 ] && [ "$wifi_speed" -le -61 ]; then
			icon_wifi="󰤢"
		elif [ "$wifi_speed" -le -71 ]; then
			icon_wifi="󰤟"
		fi
	else
		icon_wifi="󰤮"
		var_wifi=$is_connected
	fi

	if [ -n "$is_charging" ]; then
		icon_battery=""
		if [ "$battery_check" -lt 20 ]; then
			send_notification_at="$battery_check"
		fi
	else
		if [ "$battery_check" -ge 80 ]; then
			icon_battery=" "
		elif [ "$battery_check" -lt 80 ] && [ "$battery_check" -ge 60 ]; then
			icon_battery=" "
		elif [ "$battery_check" -lt 60 ] && [ "$battery_check" -ge 40 ]; then
			icon_battery=" "
		elif [ "$battery_check" -lt 40 ] && [ "$battery_check" -ge 20 ]; then
			icon_battery=" "
		elif [ "$battery_check" -lt 20 ]; then
			icon_battery=" "
		fi
	fi

	dwm -s " $icon_time $var_time  $icon_date $var_date  $icon_wifi $var_wifi  $icon_uptime $var_uptime  $icon_memory $var_memory  $icon_temp $var_temp  $icon_battery $var_battery "

	if [ -z "$is_charging" ] && [ "$battery_check" -eq "$send_notification_at" ]; then
		notify
		send_notification_at=$((send_notification_at - 2))
	fi

	sleep 3s
done
