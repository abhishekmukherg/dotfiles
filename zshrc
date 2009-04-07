# [[ $SHLVL -eq 1 ]] && screen && exit
#bindkey -e
bindkey -v

autoload -U compinit colors
compinit
colors

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

# ssh, scp, ping, host
zstyle ':completion:*:scp:*' tag-order \
      'hosts:-host hosts:-domain:domain hosts:-ipaddr:IP\ address *'
zstyle ':completion:*:scp:*' group-order \
      users files all-files hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order \
      users 'hosts:-host hosts:-domain:domain hosts:-ipaddr:IP\ address *'
zstyle ':completion:*:ssh:*' group-order \
      hosts-domain hosts-host users hosts-ipaddr

zstyle ':completion:*:(ssh|scp):*:hosts-host' ignored-patterns \
      '*.*' loopback localhost
zstyle ':completion:*:(ssh|scp):*:hosts-domain' ignored-patterns \
      '<->.<->.<->.<->' '^*.*' '*@*'
zstyle ':completion:*:(ssh|scp):*:hosts-ipaddr' ignored-patterns \
      '^<->.<->.<->.<->' '127.0.0.<->'
zstyle ':completion:*:(ssh|scp):*:users' ignored-patterns \
      adm bin daemon halt lp named shutdown sync

zstyle -e ':completion:*:(ssh|scp):*' hosts 'reply=(
      ${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) \
                      /dev/null)"}%%[# ]*}//,/ }
      ${=${(f)"$(cat /etc/hosts(|)(N) <<(ypcat hosts 2>/dev/null))"}%%\#*}
      ${=${${${${(@M)${(f)"$(<~/.ssh/config)"}:#Host *}#Host }:#*\**}:#*\?*}}
      )'


# Uses Cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion::complete:*' use-cache 1

# make zsh not kill background jobs when it closes
setopt nohup

unsetopt clobber
setopt extended_history auto_pushd inc_append_history hist_ignore_dups hist_verify auto_continue multios interactive_comments autocd extended_glob notify list_ambiguous
DIRSTACKSIZE=50
limit coredumpsize 10m

HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=10000

## With commands like `rm' it's annoying if one gets offered the same filename
## again even if it is already on the command line. To avoid that:
#
zstyle ':completion:*:rm:*' ignore-line yes

## Load the completion module.
zstyle :compinstall filename '/home/master/.zshrc'

alias ls='ls --color=auto'
alias sl='sl -al'
alias ll='ls -l'
alias grep='ack'
alias jobs='jobs -dlp'

alias apt='sudo aptitude'
alias apti='apt install'
alias aptc='apt-cache'
alias aptcs='apt-cache search'

alias paludis='sudo nice paludis'

#exec 2>>(while read line; do
	#print "${fg[red]}${(q)line}${reset_color}" > /dev/tty; print -n $'\0'; done)

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
bindkey  ";5D"    backward-word
bindkey  ";5C"   forward-word

[[ -f /etc/zsh_command_not_found ]] && source /etc/zsh_command_not_found
[[ -f ~/.dir_colors ]] && eval "`dircolors ~/.dir_colors -b`"

#eval "`keychain --agents ssh --quiet --eval id_rsa`"
#[ -z "$HOSTNAME" ] && HOSTNAME=`uname -n`
#[ -f $HOME/.keychain/$HOSTNAME-sh ] && \
	#. $HOME/.keychain/$HOSTNAME-sh
#[ -f $HOME/.keychain/$HOSTNAME-sh-gpg ] && \
	#. $HOME/.keychain/$HOSTNAME-sh-gpg

autoload -U promptinit
promptinit
#prompt fire white blue cyan white blue blue
prompt elite2 green cyan
export PS2="%{$fg_no_bold[grey]%}%_%{$reset_color%}- "
export RPS1="%{$fg_no_bold[cyan]%}(%1(j,%{$fg_bold[blue]%},%{$reset_color%})%j %(?,%{$reset_color%},%{$fg[red]%})%?%{$reset_color%}"

fortune -s

# zmodload zsh/zftp
# autoload -U zfinit
# zfinit
zle_highlight=(region:underline
               special:bold
              )
