#!/bin/bash

set -e
set -o nounset

URL="http://www.vim.org/scripts/download_script.php?src_id=10110"

curl -o Align.vba.gz "$URL"
gunzip Align.vba.gz
vim Align.vba -c 'so %' -s <(echo :quit)
rm Align.vba

files=$(cat vim/.VimballRecord | /bin/grep -o "delete('[a-zA-Z0-9_./-]*" | cut -d\' -f2- | sed 's:.*/.\?vim/::')
echo $files

folder=vim/bundle/align
mkdir -p $folder
for file in $files; do
	dir=$folder/$(dirname $file)
	echo Making $dir
	mkdir -p $folder/$(dirname $file)

	echo mv vim/$file $folder/$(dirname $file)
	mv vim/$file $folder/$(dirname $file)
done
