function g() {
    if (( $+commands[rg] )); then
        rg "$@"
    elif (( $+commands[ag] )); then
        ag "$@"
    elif (( $+commands[ack] )); then
        ack "$@"
    else
        echo "Falling back to grep :(" >&2
        grep -R "$@" .
    fi
}
