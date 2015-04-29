goactivate() {
    export OLDGOPATH="$GOPATH"
    export OLDPS1=$PS1

    export GOPATH="$(builtin cd "$(dirname "${BASH_SOURCE[0]:-$_}" )" && pwd):$GOPATH"
    export PS1="[go:$(basename $GOPATH)] $PS1"
}
godeactivate() {
    export PS1="$OLDPS1"
    export GOPATH="$OLDGOPATH"
    unset OLDGOPATH
    unset OLDPS1
    unalias gcd
    unset godeactivate
}
