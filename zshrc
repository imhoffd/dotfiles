# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="minimal"
DEFAULT_USER="dwieeb"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# ZSH_TMUX_AUTOSTART="true"
ZSH_TMUX_AUTOCONNECT="false"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git tmux vi-mode heroku golang gulp pass docker docker-compose)

export GPGKEY=6B4B0C48

export EDITOR="vim"
export VISUAL="vim"

umask 002
bindkey '^R' history-incremental-pattern-search-backward
bindkey -M viins 'jk' vi-cmd-mode

export GOROOT=$HOME/src/go
export GOPATH=$HOME/scripts/go

if [[ -d "$HOME/bin" ]]; then
    PATH=$HOME/bin:$PATH
fi

if [[ -d "$HOME/.rvm" ]]; then
    PATH=$HOME/.rvm/bin:$PATH
fi

if [[ -d "$GOPATH" ]]; then
    PATH=$GOROOT/bin:$GOPATH/bin:$PATH
fi

if [[ -d "$HOME/.cargo" ]]; then
    PATH=$HOME/.cargo/bin:$PATH
fi

export VIRTUAL_ENV_DISABLE_PROMPT='1'

if [[ -d "$HOME/.nvm" ]]; then
    source ~/.nvm/nvm.sh
fi

# shortcuts
if [[ -x "$(which nvim)" ]]; then
    alias vi=nvim
else
    alias vi=vim
fi

alias    ll="ls -alh"
alias    l="ll"
alias    ....="cd ../../.."
alias    .....="cd ../../../.."
alias    df="df -h"
alias    du="du -h"
function vman() { man "$*" | vi -; }

function s() {
    if [[ -d "$PWD/venv" ]]; then
        source "$PWD/venv/bin/activate"
    fi

    if [[ -f "$PWD/.env" ]]; then
        source "$PWD/.env"
    fi
}

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

source $ZSH/oh-my-zsh.sh
