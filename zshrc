# [[ $SHLVL -eq 1 ]] && screen && exit
bindkey -e

autoload -U compinit
compinit

zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'

# fuzzy completion
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'

# kill shits
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"

# Uses Cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion::complete:*' use-cache 1

# make zsh not kill background jobs when it closes
setopt nohup

unsetopt clobber
setopt extended_history
setopt auto_pushd
setopt inc_append_history
setopt hist_ignore_dups
setopt hist_verify
setopt auto_continue
setopt multios
setopt interactive_comments
DIRSTACKSIZE=50
limit coredumpsize 10m

HISTSIZE=2000
HISTFILE=~/.zsh_history
SAVEHIST=2000

## With commands like `rm' it's annoying if one gets offered the same filename
## again even if it is already on the command line. To avoid that:
#
zstyle ':completion:*:rm:*' ignore-line yes

## Load the completion module.
zstyle :compinstall filename '/home/master/.zshrc'

setopt extended_glob
setopt notify
setopt list_ambiguous

alias ls='ls --color=auto'
alias sl='sl -al'
alias ll='ls -l'
alias jobs='jobs -dlp'

alias apt='sudo aptitude'
alias apti='apt install'
alias aptc='apt-cache'
alias aptcs='apt-cache search'

CFLAGS='-Wall -g -O0'
export CFLAGS

autoload zkbd
[[ ! -d ~/.zkbd ]] && mkdir ~/.zkbd
[[ ! -f ~/.zkbd/$TERM-${DISPLAY:-$VENDOR-$OSTYPE} ]] && zkbd
source ~/.zkbd/$TERM-${DISPLAY:-$VENDOR-$OSTYPE}

# setup key accordingly
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Left]}"    ]]  && bindkey  ";5D"    backward-word
[[ -n "${key[Right]}"   ]]  && bindkey  ";5C"   forward-word

keychain id_rsa 2> /dev/null
[ -z "$HOSTNAME" ] && HOSTNAME=`uname -n`
[ -f $HOME/.keychain/$HOSTNAME-sh ] && \
	. $HOME/.keychain/$HOSTNAME-sh
[ -f $HOME/.keychain/$HOSTNAME-sh-gpg ] && \
	. $HOME/.keychain/$HOSTNAME-sh-gpg

autoload -U promptinit
promptinit
prompt elite2 2> /dev/null

fortune -s
