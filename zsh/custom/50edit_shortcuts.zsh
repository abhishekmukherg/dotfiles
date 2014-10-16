function vz() {
    (cd $zshhome; vim custom/legacy.zsh $HOME/.wzshrc ../zshenv)
}
function sz() {
    source ~/.zshrc
}

function vv() {
    (cd $(dirname $(readlink ~/.vimrc)); vim $(basename $(readlink ~/.vimrc)))
}
