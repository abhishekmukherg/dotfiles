
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

alias sql='cd ~/bin/sql'

alias bugz='bugz --connection=default'

alias fig='docker-compose'
