#!/bin/sh

session_list=$(echo "$(tmux ls)" | grep -v "attached" | awk -F ":" '{print $1}')
selected_session=$(echo "$session_list" | fzf --reverse)
echo $selected_session
if [ -z "$selected_session" ]; then
	exit 0
fi
if [ -n "$TMUX" ]; then
	tmux switch-client -t "$selected_session"
fi
tmux attach-session -t "$selected_session"
