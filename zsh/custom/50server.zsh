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
    python -c "import SimpleHTTPServer, SocketServer
Handler = SimpleHTTPServer.SimpleHTTPRequestHandler
Handler.address_string = lambda self: str(self.client_address[0])
httpd = SocketServer.TCPServer(('', $port), Handler)
print 'serving at port $port'
httpd.serve_forever()
"
}
