#
# Aliases
#

alias ta='tmux attach -t'
alias tl='tmux list-sessions'

# Wrapper function for tmux.
function _zsh_tmux_plugin_run() {
  export TERM=xterm-256color

  \tmux $@
}

# Use the completions for tmux for our function
compdef _tmux _zsh_tmux_plugin_run

# Alias tmux to our wrapper function.
alias tmux=_zsh_tmux_plugin_run
