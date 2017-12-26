# {{{ ZPlug Configuration
if [[ "$TERM" != 'dumb' ]]; then
    zstyle ':prezto:*:*' color 'on'
fi
zstyle ':prezto:module:utility' safe-ops 'off'
zstyle ':prezto:module:pacman' frontend 'pacaur'
export ZPLUG_HOME=~/.zplug/
source $ZPLUG_HOME/init.zsh
# }}}

# {{{ ZPlug Plugins
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
# # Make sure to use double quotes
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"

# Grab binaries from GitHub Releases
# and rename with the "rename-to:" tag
zplug "junegunn/fzf", \
    as:command, \
    use:"bin/fzf-tmux"
zplug "junegunn/fzf-bin", \
    as:command, \
    from:gh-r, \
    rename-to:"fzf"
zplug "junegunn/fzf", use:shell/key-bindings.zsh, defer:2

zplug "plugins/zsh_reload", from:oh-my-zsh
zplug "plugins/archlinux", from:oh-my-zsh
zplug "modules/environment", from:prezto
zplug "modules/gnu-utility", from:prezto, if:"[[ $OSTYPE == *darwin* ]]"
zplug "modules/utility", from:prezto, defer:1
zplug "modules/fasd", from:prezto
zplug "modules/history", from:prezto
zplug "sharat87/zsh-vim-mode", defer:1
zplug "zdharma/fast-syntax-highlighting", defer:2

zplug "mafredri/zsh-async"
zplug "sindresorhus/pure", use:pure.zsh, as:theme
# }}}

# {{{ ZPlug Startup
if ! zplug check; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load
# }}}

HISTFILE=$HOME/.zsh/history

# {{{ SSH Auth Sock magic
if [[ -n "${SSH_CONNECTION:-}" ]]; then
    SOCK=$HOME/.local/share/ssh-agent/ssh-auth.sock
    mkdir -p $(dirname $SOCK)
    chmod 0700 $(dirname $SOCK)
    if [[ $SSH_AUTH_SOCK = /tmp/ssh-* ]] && [[ -e $SSH_AUTH_SOCK ]] && [[ "$(readlink $SOCK)" != "$SSH_AUTH_SOCK" ]]; then
        (umask 077 && ln -sf $SSH_AUTH_SOCK $SOCK)
    fi
    echo $SOCK $SSH_AUTH_SOCK
    export SSH_AUTH_SOCK=$SOCK
fi
# }}}

# {{{ Keybinds
bindkey -M vicmd -r 'H'
bindkey -M viins -r '\eh'
bindkey -M vicmd 'K' run-help
# }}}

# {{{ Aliases
alias drun="docker run --rm -it"
alias fig=docker-compose
# }}}

# {{{ Additional sources from external commands
if (( $+commands[kubectl] )); then
  source <(kubectl completion zsh)
fi
if (( $+commands[pew] )); then
  source "$(pew shell_config)"
fi
# }}}

# {{{ .wzshrc
if [[ -f "$HOME/.wzshrc" ]]; then
   source "$HOME/.wzshrc"
fi
# }}}

# vim: set fdm=marker foldlevel=0:
