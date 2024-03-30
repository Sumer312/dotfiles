# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTFILE=~/.zsh_history
SAVEHIST=10000
HISTSIZE=10000
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

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
alias py="python3"
alias lock="/home/sumer/shellScripts/lock.sh"
alias toggleascii="/home/sumer/shellScripts/toggleAscii.sh"
alias audio="mpv --no-video"
alias ls="lsd -lF"
alias cat="batcat"

# Flatpak
alias firefox="flatpak run org.mozilla.firefox"

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
export ROFI_PASS_CONFIG=$HOME/.config/rofi-pass/config
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin
export PASSWORD_STORE_DIR=/home/sumer/.password-store
export LANG="en_IN.utf8"
colorscript -r

# Created by `pipx` on 2023-11-24 14:56:54
# export PATH="$PATH:/home/sumer/.local/bin"
