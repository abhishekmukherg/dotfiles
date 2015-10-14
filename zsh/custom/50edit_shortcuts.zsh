function vz() {
    (cd $zshhome; vim custom/ $HOME/.wzshrc ../zshenv)
}
function vv() {
    (cd $(dirname $(readlink ~/.vimrc)); vim $(basename $(readlink ~/.vimrc)))
}
