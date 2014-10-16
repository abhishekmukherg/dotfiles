## Gitignore.io
function gi() {
    local output="$(curl -s http://www.gitignore.io/api/$@)"
    if [[ $1 == "list" ]]; then
        echo "$output" | tr ',' '\n' | sort | column | column | column -t
    else
        echo "$output"
    fi
}
