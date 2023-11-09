# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTFILE=~/.zsh_history
SAVEHIST=10000
HISTSIZE=10000

# unsetopt menu_complete
# unsetopt flowcontrol

# setopt prompt_subst
# setopt always_to_end
# setopt append_history
# setopt auto_menu
# setopt complete_in_word
# setopt extended_history
# setopt hist_expire_dups_first
# setopt hist_ignore_dups
# setopt hist_ignore_space
# setopt hist_verify
# setopt inc_append_history
# setopt share_history

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
if [[ $(echo "$TERM") == "xterm-kitty" ]]; then 
  alias icat="kitty +kitten icat"
  alias toggle="/home/sumer/Documents/bashScripts/themeToggle.sh"
fi

alias py="python3"
alias goose="~/go/bin/goose"
alias lock="~/Documents/bashScripts/lock.sh"
alias audio="mpv --no-video"
alias l="lsd -lF"

# Flatpak
alias firefox="flatpak run org.mozilla.firefox"
alias thunderbird="flatpak run org.mozilla.Thunderbird"

#Packages
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/autojump/autojump.zsh
bindkey '^[k' history-substring-search-up
bindkey '^[j' history-substring-search-down
bindkey '^ ' autosuggest-accept

export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin
LANG="en_IN.utf8"
export LANG
colorscript -r
#Enable vi
# set -o vi
# bindkey -v
