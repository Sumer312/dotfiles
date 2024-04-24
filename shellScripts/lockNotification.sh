#!/bin/sh

dunstify -u critical -t 10000 -- ' Locking in 20 seconds' &
mpv --no-video /home/sumer/Music/interface-soft-click-131438.mp3 & 
mpv_pid=$!

wait "$mpv_pid"
