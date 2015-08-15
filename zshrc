# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="minimal"
DEFAULT_USER="dwieeb"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git tmux symfony2 web-search vi-mode heroku)
# plugins=(composer)

export GPGKEY=6B4B0C48

source $ZSH/oh-my-zsh.sh

export EDITOR="vim"
export VISUAL="vim"

umask 002
bindkey '^R' history-incremental-pattern-search-backward
bindkey -M viins 'jk' vi-cmd-mode

export GOROOT=$HOME/src/go
export GOPATH=$HOME/scripts/go

PATH=$HOME/bin:$PATH
PATH=$HOME/.rvm/bin:$PATH # Add RVM to PATH
PATH=$GOPATH/bin:$PATH

VIRTUAL_ENV_DISABLE_PROMPT='1'

if [[ -d "$HOME/.python" && -z "$VIRTUAL_ENV" ]]; then
    source $HOME/.python/bin/activate
fi

if [[ -d "$HOME/.nvm" ]]; then
    source ~/.nvm/nvm.sh
fi

# shortcuts
alias    vi=vim
#alias    ps="ps aux | grep \"^$(id -nu)\""
alias    ll="ls -alh"
alias    l="ll"
alias    ....="cd ../../.."
alias    .....="cd ../../../.."
alias    df="df -h"
alias    du="du -h"
alias    tmux="TERM=screen-256color-bce tmux"
alias    tmuxa="tmux attach-session"
alias    tmuxl="tmux list-sessions"
function vman() { man "$*" | vi -; }

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
