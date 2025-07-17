#!/bin/sh

path=$(zoxide query -ls | fzf --reverse --tmux center | awk -F " " '{print $2}') 
if [ -z "$path" ]; then
	exit 0
fi

# >/dev/null redirects stdout to /dev/null
# 1>/dev/null redirects stdout to /dev/null
#
# 2>/dev/null redirects stderr to /dev/null
#
# &>/dev/null redirects stdout and stderr to /dev/null
# >/dev/null2>&1 redirects stdout and stderr to /dev/null

dir_name=$(echo "$path" | awk -F "/" '{print $NF}')
session_number=$(echo "$(tmux ls 2>/dev/null | wc -l) + 1" | bc)
session_name=" $session_number | ${dir_name} "

if [ -z "$TMUX" ]; then
	tmux new -s "$session_name" -c "$path"
	exit 0
fi
tmux new -ds "$session_name" -c "$path"
tmux switch-client -t "$session_name"
