#!/bin/sh

if [ -n "$TMUX" ]; then
	list=$(tmux ls)
	attached_session=$(echo "$list\n" | grep "attached" | awk -F ":" '{print $1}')
	tmux kill-session -t "$attached_session"
fi
