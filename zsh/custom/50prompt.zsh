local prompt_color
if [[ $SSH_CLIENT == "" ]]; then
  local prompt_color=cyan
else
  local prompt_color=green
fi

if (( $+commands[cksum] )); then
    local -i hostname_hash="$(( $(hostname -f | cksum | cut -d' ' -f1) % 6 + 1 ))"
    local -a fg_colors
    fg_colors=( cyan green yellow blue magenta white )
    prompt_color="${fg_colors[$hostname_hash]}"
    unset fg_colors
    unset hostname_hash
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

typeset -ga chpwd_functions

local svnbranchinfo=
get_branch_info() {
    local svn=$(svn_current_branch_name)
    if [[ -n $svn ]]; then
        if [[ $PWD != */trsrc-${svn##*/}* ]]; then
            svnbranchinfo=" ($svn)"
        else
            svnbranchinfo=""
        fi
    else
        svnbranchinfo=""
    fi
}

chpwd_functions+='get_branch_info'

isauthed() {
    if [[ ${SVNTR_SUBSHELL:-} == 1 ]]; then
        echo -n "${fgc}s"
    else
        echo -n "${bgc}-"
    fi
}
local is_subshell=$(isauthed)

export PS1="${bgc}[$fgc%n$bgc@$fgc%m $fgc%~$bgc\${svnbranchinfo}]$reset%# "

local bgc=${bgc//[%]b/%%b}
local fgc=${fgc//[%]b/%%b}
local reset=${reset//[%]b/%%b}
