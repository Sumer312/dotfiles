#!/bin/sh

list=$(tmux ls)
session_names=$(echo "$list\n" | grep -v "attached" | awk -F ":" '{print $1}')
selected_session=$(echo "$session_names\n" | fzf --reverse)
if [ -z "$selected_session" ]; then
	exit 0
fi
if [ -n "$TMUX" ]; then
	tmux switch-client -t "$selected_session"
fi
tmux attach-session -t "$selected_session"
