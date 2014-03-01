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
bindkey -M vicmd v edit-command-line
