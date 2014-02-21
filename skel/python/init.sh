#!/bin/bash

set -e
set -o nounset
set -o pipefail

echo "## Getting bootstrap"
curl -so bootstrap.py 'http://downloads.buildout.org/2/bootstrap.py'

echo "## Setting up virtualenv"
if which virtualenv >/dev/null 2>&1; then
    virtualenv --no-site-packages .env
    ./.env/bin/python bootstrap.py
else
    python bootstrap.py
fi

./bin/buildout
