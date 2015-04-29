# Path to your oh-my-zsh configuration.


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
COMPLETION_WAITING_DOTS="true"

ZSH_TMUX_AUTOSTART=true

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(zsh-completions goenv git github ant fasd pip screen svn-fast-info go gradle git-flow-avg rbenv zsh-syntax-highlighting zsh_reload pyenv)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

if [[ -f ~/google-cloud-sdk/path.zsh.inc ]]; then
    source ~/google-cloud-sdk/path.zsh.inc
fi
