# [[ $SHLVL -eq 1 ]] && screen && exit
#bindkey -e
#which keychain > /dev/null && keychain -q
bindkey -v

[[ $ZSHENV_LOADED == "1" ]] || source ~/.zshenv

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
setopt extended_history auto_pushd inc_append_history hist_ignore_dups
setopt hist_verify auto_continue multios interactive_comments autocd
setopt extended_glob notify list_ambiguous
DIRSTACKSIZE=50
limit coredumpsize 10m

HISTSIZE=200000
mkdir -p ~/.zsh
HISTFILE=~/.zsh/history
SAVEHIST=20000

## With commands like `rm' it's annoying if one gets offered the same filename
## again even if it is already on the command line. To avoid that:
#
zstyle ':completion:*:rm:*' ignore-line yes

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

try_alias sl sl -al || alias sl='ls'
alias ll='ls -l'
try_which gitk gitview
alias ga="gitk --all &|"
alias less=/usr/bin/less

mvim_remote()
{
    if [[ $# > 0 ]]; then
        mvim --remote-silent "$@"
    else
        mvim "$@"
    fi
}
if which mvim >/dev/null 2>&1; then
    alias vim="mvim_remote"
    alias V='\vim -'
else
    alias V='vim -'
fi
alias v="vim"
try_which grep ack-grep
try_which grep ack
try_which xo xdg-open
alias jobs='jobs -dlp'
alias logdir='cd /etc/httpd-MAINLINE/logs'

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
grep_sl()
{
  egrep -v "^.{${1:-120},}"
}
try_which diff colordiff

alias paludis='sudo nice paludis'
alias ip='paludis --install --continue-on-failure if-satisfied'
alias ipu='ip --dl-reinstall if-use-changed'
alias pacman='sudo pacman -y'

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

[[ -f /etc/zsh_command_not_found ]] && source /etc/zsh_command_not_found
[[ -f ~/.dir_colors ]] && which dircolors >/dev/null 2>&1 && eval "`dircolors ~/.dir_colors -b`"

#eval "`keychain --agents ssh --quiet --eval id_rsa`"
#[ -z "$HOSTNAME" ] && HOSTNAME=`uname -n`
#[ -f $HOME/.keychain/$HOSTNAME-sh ] && \
  #. $HOME/.keychain/$HOSTNAME-sh
#[ -f $HOME/.keychain/$HOSTNAME-sh-gpg ] && \
  #. $HOME/.keychain/$HOSTNAME-sh-gpg
  
autoload -Uz vcs_info

local prompt_color
if [[ $SSH_CLIENT == "" ]]; then
  local prompt_color=cyan
else
  local prompt_color=green
fi

if [[ $UID == 0 ]]; then
  local prompt_color=red
fi

local bgc="%B%F{black}"
local fgc="%b%F{$prompt_color}"
local error="%F{red}"
local jobcolor="%F{blue}"
local reset="%b%f"
if [[ $(echo $ZSH_VERSION | cut -d. -f3) < 9 ]]; then
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

vd()
{
  cd "$@" && ls --color=always --format=vertical | head
}

which fortune > /dev/null 2>&1 && fortune -s

# zmodload zsh/zftp
# autoload -U zfinit
# zfinit
zle_highlight=(region:underline
               special:bold
              )

which pip >/dev/null 2>&1 && eval "`pip completion --zsh`"
which virtualenvwrapper.sh > /dev/null 2>&1 && source =virtualenvwrapper.sh

function cdtop() { cd $TRTOP/$@ }
function cdtr() { cd $TRTOP/tr/$@ }
function cdjs() { cdtop site/js3/$@ }
function cdjs2() { cdtop site/js2/$@ }
function cdimg() { cdtop site/img2/$@ }
function cdcss() { cdtop site/css2/$@ }
function cdvm() { cdtop site/velocity_redesign/$@ }

alias vc='vim $TRTOP/config/hosts/$(hostname -s).ini'
alias tweak='$TRTOP/scripts/tweak'
alias fs='$TRTOP/scripts/find-string --relative'
alias japp="(cdtop && ant jar-applications)"
alias jtr="(cdtop && ant jar-tr)"
alias ja='make -C $TRTOP'
alias jj='make -C $TRTOP java'
alias jjs='make -C $TRTOP/site/js3 -j5'
alias jjs2='make -C $TRTOP/site/js2 -j5'
alias jcss='make -C $TRTOP/site/css2 -j5'
function ts()
{
    $TRTOP/scripts/$@
}
function sts()
{
    sudo $TRTOP/scripts/$@
}

alias dev='ssh g-dev.tripadvisor.com'
alias odin='ssh g@odin.dhcp.tripadvisor.com'
alias lumberjack='cd /lumberjack/logs'

function _flocal()
{
    local dir=$1
    shift
    find $TRTOP/$dir -not -path '*/.svn/*' -iname '*'"$@"'*' -not -name .cvsignore -type f
}

function _elocal()
{
    local dir="$1"
    shift
    "$EDITOR" $(_flocal "$dir" "$@")
}

function ftr() { _flocal tr "$@" }
function etr() { _elocal tr "$@" }

function st()
{
    local curdir=`pwd`
    while true; do
        case $(basename $(pwd)) in
        trsrc-*)
            export TRTOP=`pwd`
            cd "$curdir"
            return 0
            ;;
        /)
            echo "Could not find TRTOP"
            cd "$curdir"
            return 2
            ;;
        *)
            cd ..
            ;;
        esac
    done
}

# CD Aliases
alias ...='cd ../..'
alias ....='cd ../../..'

alias tripmonster='psql -U tripmonster -h tripmonster'
alias dev-db='psql -h dev-db -U tripmaster'
alias rivendell='psql -h rivendell -U tripmaster'

function magic_svn_command()
{
    for x in `svntr pg -R svn:mergeinfo . | grep ' - ' | grep -v '^\.' | awk '{print $1}'`; do
        svntr pd svn:mergeinfo $x
    done
}

function allcompress()
{
    for i in {js,css}_{concat,compress}; do
        $TRTOP/scripts/tweak_feature_$1.sh $i;
    done
}


alias sbt="st && (cdtop && source ~/bin/set_trtop)"
alias svn_conflicts="svntr st | egrep '^\s*C'"
alias bugz_patch='noglob ~/bin/bugz_patch'
alias slog='svntr login amukherjee'
alias fix-eclipse='$TRTOP/scripts/fix-eclipse-tr.py $TRTOP'
alias hoot='$TRTOP/scripts/hoot'
function tab()
{
    (
        cd $TRTOP
        if [[ $# -gt 0 ]]; then
            echo ./scripts/tabuild "$@"
            sudo ./scripts/tabuild "$@"
        else
            echo ./scripts/tabuild -rf
            sudo ./scripts/tabuild -rf
        fi
    )
}

function onoz()
{
    if [[ "$1" == "lb" ]] || [[ "$1" == "lookback" ]]; then
        shift
        $HOME/bin/curl -A iphone -s -o /dev/null $(hostname -f)
        $HOME/bin/lookback_tail "$@"
    elif [[ "$1" == "trip" ]]; then
        highlight_tail /etc/httpd-MAINLINE/logs/tripadvisor.log
    elif [[ "$1" == "access" ]]; then
        highlight_tail /etc/httpd-MAINLINE/logs/access_log
    else
        echo "Try again? (lb|trip|access)" 1>&2
        return 2
    fi
}

function nzgrep()
{
    local num=$(find . -type f | wc -l | perl -pe '$_ /= 12; if($_ < 1) { $_ = 1 }; $_ = int($_)')
    find . -print0 -type f | xargs -0 -n$num -P8 zgrep "$@"
}

[[ -e ~/.zsh_local ]] && source ~/.zsh_local

## Some hadoop related aliases to start hadoop
alias hfs="hadoop fs"
alias hls="hfs -ls"
alias hjar="hadoop jar /opt/hadoop/hadoop*examples*.jar"
alias set_javahome="source /etc/profile.d/java_home.sh"
alias uc_adhoc='set_javahome && cd /home/amukherjee/Documents/warehouse/clusters/adhoc/config && source env.bash /home/amukherjee/Documents/warehouse/clusters/adhoc && cd - && rehash'
alias uc_prod='set_javahome && cd /home/amukherjee/Documents/warehouse/clusters/prod/config && source env.bash /home/amukherjee/Documents/warehouse/clusters/prod && cd - && rehash'

true
