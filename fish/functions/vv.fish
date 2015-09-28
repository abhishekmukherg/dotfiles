function vv
    set -l vimrc (readlink ~/.vimrc)
    set -l vimrcdir (dirname $vimrc)
    fish -c "cd $vimrcdir; vim $vimrc"
end
