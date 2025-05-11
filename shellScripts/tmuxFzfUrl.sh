#!/bin/sh

content="$(tmux capture-pane -J -p -e | sed -r 's/\x1B\[[0-9;]*[mK]//g'))"
urls=$(echo "$content" | grep -oE '(https?|ftp|file):/?//[-A-Za-z0-9+&@#/%?=~_|!:,.;]*[-A-Za-z0-9+&@#/%=~_|]')
wwws=$(echo "$content" | grep -oE '(http?s://)?www\.[a-zA-Z](-?[a-zA-Z0-9])+\.[a-zA-Z]{2,}(/\S+)*' | grep -vE '^https?://' | sed 's/^\(.*\)$/http:\/\/\1/')
ips=$(echo "$content" | grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}(:[0-9]{1,5})?(/\S+)*' | sed 's/^\(.*\)$/http:\/\/\1/')
gits=$(echo "$content" | grep -oE '(ssh://)?git@\S*' | sed 's/:/\//g' | sed 's/^\(ssh\/\/\/\)\{0,1\}git@\(.*\)$/https:\/\/\2/')
gh=$(echo "$content" | grep -oE "['\"]([_A-Za-z0-9-]*/[_.A-Za-z0-9-]*)['\"]" | sed "s/['\"]//g" | sed 's#.#https://github.com/&#')

if [ $# -ge 1 ] && [ $1 != "" ]; then
	extras=$(echo "$content" | eval "$1")
fi

items=$(printf '%s\n' "$urls" "$wwws" "$gh" "$ips" "$gits" "$extras" | grep -v '^$' | sort -u | nl -w3 -s "  ")
if [ -z "$items" ]; then
	tmux display "No URLs found" && exit
fi

selected_url=$(echo "$items" | awk '{print $2}' | fzf --reverse --tmux center)
if [ -z $selected_url ]; then
	tmux display "No URLs chosen" && exit
else
	if [ -z $BROWSER ]; then
		tmux display "BROWSER variable not defined in bashrc" && exit
	else
		$BROWSER $selected_url
	fi
fi
