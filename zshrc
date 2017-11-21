if [[ "$TERM" != 'dumb' ]]; then
  zstyle ':prezto:*:*' color 'on'
  zstyle ':prezto:module:prompt' theme 'off'
fi
zstyle ':prezto:module:utility' safe-ops 'off'

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# # Make sure to use double quotes
zplug "zsh-users/zsh-history-substring-search"

# Grab binaries from GitHub Releases
# and rename with the "rename-to:" tag
zplug "junegunn/fzf", \
    as:command, \
    use:"bin/fzf-tmux"
zplug "junegunn/fzf-bin", \
    as:command, \
    from:gh-r, \
    rename-to:"fzf"

zplug "plugins/archlinux", from:oh-my-zsh
zplug "modules/environment", from:prezto
zplug "modules/gnu-utility", from:prezto
zplug "modules/utility", from:prezto
zplug "modules/fasd", from:prezto
zplug "modules/history", from:prezto
zplug "sharat87/zsh-vim-mode", defer:1
zplug "zdharma/fast-syntax-highlighting", defer:2

zplug "mafredri/zsh-async"
zplug "sindresorhus/pure", use:pure.zsh, as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load

HISTFILE=$HOME/.zsh/history
