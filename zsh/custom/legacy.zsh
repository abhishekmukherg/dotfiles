# [[ $SHLVL -eq 1 ]] && screen && exit
#bindkey -e
#which keychain > /dev/null && keychain -q
bindkey -v

[[ $ZSHENV_LOADED == "1" ]] || source ~/.zshenv

autoload -U compinit colors
compinit
colors

# fuzzy completion
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'

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

try_alias() {
  cmd=$1
  shift
  "$@" >/dev/null 2>&1 && alias $cmd="$*"
}

try_which() {
  cmd=$1
  shift
  which "$@" >/dev/null 2>&1 && alias $cmd="$*"
}

try_alias ls ls --color=auto || try_alias ls ls -G

alias mkdir='noglob mkdir'
alias ll='ls -lt'
try_which gitk gitview
alias ga="gitk --all &|"
try_which ga stree
alias mt=multitail

function kill_monkey()
{
    adb shell ps | awk '/com\.android\.commands\.monkey/ { system("adb shell kill " $2) }'
}

alias V='vim -R -'
alias v="vim"
try_which xo xdg-open
alias jobs='jobs -dlp'

try_which gzip pigz
try_which bzip2 pbzip2

if which aptitude >/dev/null 2>&1; then
    alias apt='sudo aptitude'
    alias apti'apt install --with-recommends'
else
    alias apt='sudo apt-get'
    alias apti='apt install'
fi
alias aptc='apt-cache'
alias aptcs='apt-cache search'

try_which diff colordiff

try_which ack ack-grep

alias paludis='sudo nice paludis'
alias ip='paludis --install --continue-on-failure if-satisfied'
alias ipu='ip --dl-reinstall if-use-changed'
alias pacman='sudo pacman -y'
alias sql='cd ~/bin/sql'

alias bugz='bugz --connection=default'

#exec 2>>(while read line; do
  #print "${fg[red]}${(q)line}${reset_color}" > /dev/tty; print -n $'\0'; done)
function zkbd_file() {
    local zkbddir="$1"
    local t1="$zkbddir/${TERM}-${VENDOR}-${OSTYPE}"
    local t2="$zkbddir/${TERM}-${DISPLAY}"
    if [[ -f $t1 ]]; then
        printf '%s' "$t1"
    elif [[ -f $t2 ]]; then
        printf '%s' "$t2"
    else
        return 1
    fi
}

function load_zkbd() {
    autoload zkbd
    local zkbddir=${ZDOTDIR:-$HOME}/.zkbd
    [[ ! -d $zkbddir ]] && mkdir $zkbddir
    local zkbdfile
    zkbdfile=$(zkbd_file "$zkbddir")
    local ret=$?
    if [[ $ret -ne 0 ]]; then
        zkbd
        zkbdfile=$(zkbd_file "$zkbddir")
        ret=$?
    fi
    if [[ $ret -eq 0 ]]; then
        source "$zkbdfile"
    else
        echo 'Failed to setup keys using zkbd' 1>&2
        return 1
    fi

    # setup key accordingly
    [[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
    [[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
    [[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
    [[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
    [[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
    [[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
    [[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
    #bindkey  ";5D"    backward-word
    #bindkey  ";5C"   forward-word
}
load_zkbd || true
unfunction load_zkbd
unfunction zkbd_file

bindkey -M viins "^P" up-history
bindkey -M viins "^N" down-history

[[ -f /etc/zsh_command_not_found ]] && source /etc/zsh_command_not_found
[[ -f ~/.dir_colors ]] && which dircolors >/dev/null 2>&1 && eval "`dircolors ~/.dir_colors -b`"

#eval "`keychain --agents ssh --quiet --eval id_rsa`"
#[ -z "$HOSTNAME" ] && HOSTNAME=`uname -n`
#[ -f $HOME/.keychain/$HOSTNAME-sh ] && \
  #. $HOME/.keychain/$HOSTNAME-sh
#[ -f $HOME/.keychain/$HOSTNAME-sh-gpg ] && \
  #. $HOME/.keychain/$HOSTNAME-sh-gpg
  
autoload -Uz vcs_info

## Gitignore.io
function gi() {
    local output="$(curl -s http://gitignore.io/api/$@)"
    if [[ $1 == "list" ]]; then
        echo "$output" | tr ',' '\n' | sort | column | column | column -t
    else
        echo "$output"
    fi
}

local prompt_color
if [[ $SSH_CLIENT == "" ]]; then
  local prompt_color=cyan
else
  local prompt_color=green
fi

if [[ $UID == 0 ]]; then
  local prompt_color=red
fi

local bgc="%B%F{grey}"
local fgc="%b%F{$prompt_color}"
local error="%F{red}"
local jobcolor="%F{blue}"
local reset="%b%f"
if [[ $(echo $ZSH_VERSION | cut -d. -f1) == 3 ]] && [[ $(echo $ZSH_VERSION | cut -d. -f3) < 9 ]]; then
  local bgc="%{$fg_bold[black]%}"
  local fgc="%{$fg_no_bold[$prompt_color]%}"
  local error="%{$fg[red]%}"
  local jobcolor="%{$fg[blue]%}"
  local reset="%{$reset_color%}"
fi
export PS1="$bgc($fgc%n$bgc@$fgc%m$bgc|$fgc%h$bgc @$fgc%t$bgc){$fgc%~$bgc}$reset"
export PS1="${PS1}
$bgc-$fgc%#$reset "
export RPS1="$bgc(%b%1(j,$jobcolor,$reset)%j %(?,$reset,$error)%?$reset"

local bgc=${bgc//[%]b/%%b}
local fgc=${fgc//[%]b/%%b}
local reset=${reset//[%]b/%%b}

which fortune > /dev/null 2>&1 && fortune -s

# zmodload zsh/zftp
# autoload -U zfinit
# zfinit
which pip >/dev/null 2>&1 && eval "`pip completion --zsh`"
which virtualenvwrapper.sh > /dev/null 2>&1 && source =virtualenvwrapper.sh

alias ssh='env TERM=xterm-256color ssh'

[[ -e ~/.wzshrc ]] && source ~/.wzshrc
[[ -e ~/.zsh_local ]] && source ~/.zsh_local

## Some hadoop related aliases to start hadoop
alias hfs="hadoop fs"
alias hls="hfs -ls"
alias hjar="hadoop jar /opt/hadoop/hadoop*examples*.jar"
alias set_javahome="source /etc/profile.d/java_home.sh"

TODO_DIR="$(dirname $zshhome)/todo"
alias t="$TODO_DIR/todo.sh -d $TODO_DIR/todo.cfg"

bindkey -M vicmd v edit-command-line

function vz() {
    (cd $zshhome; vim custom/legacy.zsh $HOME/.wzshrc ../zshenv)
}
function sz() {
    source ~/.zshrc
}

function vv() {
    (cd $(dirname $(readlink ~/.vimrc)); vim $(basename $(readlink ~/.vimrc)))
}

function get_android_v4() {
    cp ~/.local/share/android-sdks/extras/android/support/v4/android-support-v4.jar .
}

alias tcpmon='sudo tcpdump -A "tcp port 80 and (((ip[2:2] - ((ip[0]&0xf)<<2)) - ((tcp[12]&0xf0)>>2)) != 0)"'

function skel() {
    local src="$HOME/.skel/$1/"
    if [[ ! -d "$src" ]]; then
        src="$(ls -d "$HOME/.skel/$1"*)"
        local num_results="$(echo "$src" | wc -l)"
        if [[ "$num_results" -eq 0 ]]; then
            echo "Could not find $src" >&2
            return 2
        elif [[ "$num_results" -gt 1 ]]; then
            echo "Found to many matches for $1:" >&2
            echo "$src"
            return 3
        fi
    fi
    echo "Copying $src"
    rsync -avP "$src"/ ./
    if [[ -x init.sh ]]; then
        ./init.sh || return 2
        rm init.sh
    fi
}

true
# vim:ts=4 sts=4 sw=4 et:
