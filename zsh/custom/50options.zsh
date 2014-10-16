# make zsh not kill background jobs when it closes
setopt nohup
unsetopt correct_all
unsetopt clobber
setopt extended_history auto_pushd inc_append_history hist_ignore_dups
setopt hist_verify auto_continue multios interactive_comments autocd
setopt extended_glob notify list_ambiguous
setopt noshare_history
setopt noauto_name_dirs
DIRSTACKSIZE=50
limit coredumpsize 10m

HISTSIZE=200000
mkdir -p ~/.zsh
HISTFILE=~/.zsh/history
SAVEHIST=20000
