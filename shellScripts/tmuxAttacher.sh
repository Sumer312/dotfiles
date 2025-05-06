#!/bin/sh

session_list=$(echo "$(tmux ls)" | grep -v "attached" | awk -F ":" '{print $1}')
selected_session=$(echo "$session_list" | fzf --reverse --tmux center)
if [ -z "$selected_session" ]; then
	exit 0
fi
tmux switch-client -t "$selected_session"
