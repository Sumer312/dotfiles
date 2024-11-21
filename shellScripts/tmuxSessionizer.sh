#!/bin/sh

path=$(zoxide query -l | fzf --reverse)
if [ -z "$path" ]; then
	exit 0
fi
session_name=$(echo "$path" | awk -F "/" '{print $NF}')
if [ -z "$TMUX" ]; then
	tmux new -s "$session_name" -c "$path"
  exit 0
fi
tmux new -ds "$session_name" -c "$path"
tmux switch-client -t "$session_name"
