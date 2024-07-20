# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=10000
HISTFILE=~/.bash_history

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

alias lock="/home/sumer/shellScripts/lock.sh"
alias tt="tt -theme harper"
alias audio="mpv --no-video"
alias ls="lsd -lFi"
alias cat="batcat"
alias lzg="lazygit"

# bash completions
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
export PASSWORD_STORE_DIR=$HOME/.password-store
export PASSWORD_STORE_CLIP_TIME=25
export LANG="en_IN.utf8"
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/.cargo/bin

source /usr/share/autojump/autojump.sh

eval "$(starship init bash)"
# colorscript -r
