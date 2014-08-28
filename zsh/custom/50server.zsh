function server() {
	local port="${1:-8000}"
	local opener=
	if which xdg-open >/dev/null 2>&1; then
		opener="xdg-open"
	elif which open >/dev/null 2>&1; then
		opener="open"
	fi
	if [[ -n $opener ]]; then
		$opener "http://localhost:${port}/"
	fi
	python -m SimpleHTTPServer "$port"
}
