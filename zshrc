setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS

export HISTSIZE=25000
export SAVEHIST="$HISTSIZE"
export HISTFILE="$HOME/.zsh_history"

export CLICOLOR="1"

export GPG_TTY=$(tty)

if [[ -n "$(command -v nvim)" ]]; then
    export EDITOR="nvim"
    export VISUAL="nvim"
    alias vim="nvim"
else
    export EDITOR="vim"
    export VISUAL="vim"
fi

export GOPATH="$HOME/go"
export VIRTUAL_ENV_DISABLE_PROMPT="1"

up-line-or-local-history() {
    zle set-local-history 1
    zle up-line-or-history
    zle set-local-history 0
}

down-line-or-local-history() {
    zle set-local-history 1
    zle down-line-or-history
    zle set-local-history 0
}

# bind to whatever keys you want for local-hist movement
bindkey '^p' up-line-or-local-history
bindkey '^n' down-line-or-local-history

zle -N up-line-or-local-history
zle -N down-line-or-local-history

umask 002
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode
bindkey '^R' history-incremental-pattern-search-backward
bindkey -M vicmd v edit-command-line

if [[ -f ~/.gnupg/.gpg-agent-info ]] && [[ -n "$(pgrep gpg-agent)" ]]; then
    source ~/.gnupg/.gpg-agent-info
    export GPG_AGENT_INFO
else
    INFO=$(gpg-agent --daemon 2> /dev/null)
    eval $INFO
    echo $INFO > ~/.gnupg/.gpg-agent-info
fi

if [[ -d "$HOME/.nvm" ]]; then
    # https://github.com/creationix/nvm/issues/1277#issuecomment-345878237
    alias nvm='unalias nvm && source "$HOME"/.nvm/nvm.sh && nvm'
fi

alias ll="ls -alh"
alias l="ll"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias dc="docker-compose"
alias dcprod="docker-compose -f docker-compose.yml -f docker-compose.prod.yml"
alias df="df -h"
alias du="du -h"
alias p="pnpm"

alias gs="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias ga="git add"
alias gap="git add -p"
alias gc="git commit"
alias gp="git pull"

if [[ -d "$GOROOT" ]]; then
    PATH="$GOROOT/bin:$PATH"
fi

if [[ -d "$GOPATH" ]]; then
    PATH="$GOPATH/bin:$PATH"
fi

if [[ -d "$HOME/bin" ]]; then
    PATH="$HOME/bin:$PATH"
fi

if [[ -d "$HOME/.rvm" ]]; then
    PATH="$HOME/.rvm/bin:$PATH"
fi

if [[ -d "$HOME/.cargo" ]]; then
    PATH="$HOME/.cargo/bin:$PATH"
fi

if [[ -d "$HOME/.yarn/bin" ]]; then
    PATH="$HOME/.yarn/bin:$PATH"
fi

if [[ -d "$HOME/Library/Android/sdk" ]]; then
    PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"
    PATH="$HOME/Library/Android/sdk/emulator:$PATH"
fi

export fpath=( "$HOME/.zsh/autoload" $fpath )

autoload edit-command-line; zle -N edit-command-line

autoload -Uz promptinit; promptinit
prompt pure

autoload -Uz compinit; compinit -u
COMPAUDIT_RESULT=$(compaudit 2> /dev/null)

if [[ -n "$COMPAUDIT_RESULT" ]]; then
  echo "\n[!] compaudit found insecure directories:"
  echo $COMPAUDIT_RESULT
fi

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

source "$HOME/.zsh/tmux.zsh"

if [[ -f ~/.zshrc.local ]]; then
    source ~/.zshrc.local
fi
