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
