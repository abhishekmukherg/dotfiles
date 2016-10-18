if (( $+commands[nvim] )) ; then
    alias vim='nvim'
fi
alias V='vim -R -'
alias v="vim"
vf() {
    v $(ag -i --file-search-regex="$1" -l .)
}
