function vz() {
    (cd $zshhome; vim ../zshrc custom/ $HOME/.wzshrc ../zshenv)
}
function vv() {
    (cd $(dirname $(readlink ~/.vimrc)); vim $(basename $(readlink ~/.vimrc)))
}
