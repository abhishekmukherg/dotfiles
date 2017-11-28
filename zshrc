# Path to your oh-my-zsh configuration.
#zmodload zsh/zprof


zshhome=$(dirname $(readlink $HOME/.zshrc))/zsh

ZSH=$zshhome/oh-my-zsh/
ZSH_CUSTOM=$zshhome/custom

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"

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
#COMPLETION_WAITING_DOTS="true"

ZSH_TMUX_AUTOSTART=true
ZSH_SSH_SKIP=true

VENV_LAZY=true
WORKON_HOME="$HOME/.virtualenvs/"

zstyle :omz:plugins:ssh-agent lifetime 4h

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
    archlinux
    command-not-found
    fasd
    fzf-zsh
    go
    goenv
    gradle
    grepper
    my-ssh-agent
    pip
    profiles
    pyenv
    rbenv
    svn-fast-info
    vi-mode
    virtualenvwrapper
    zsh-completions
    zsh_reload
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

#zprof

# Customize to your needs...

if [[ -f ~/google-cloud-sdk/path.zsh.inc ]]; then
    source ~/google-cloud-sdk/path.zsh.inc
fi

if [[ -n "${SSH_CONNECTION:-}" ]]; then
    SOCK=$HOME/.local/share/ssh-agent/ssh-auth.sock
    mkdir -p $(dirname $SOCK)
    chmod 0700 $(dirname $SOCK)
    if [[ -e $SSH_AUTH_SOCK && "$(readlink $SOCK)" != "$SSH_AUTH_SOCK" ]]; then
        (umask 077 && ln -sf $SSH_AUTH_SOCK $SOCK)
    fi
    echo $SOCK $SSH_AUTH_SOCK
    export SSH_AUTH_SOCK=$SOCK
fi
