all: $(HOME)/.vim \
	$(HOME)/.vimrc \
	vim/syntax/python.vim \
	$(HOME)/.dir_colors \
	$(HOME)/.gitconfig \
	$(HOME)/.gvimrc \
	$(HOME)/.htoprc \
	$(HOME)/.mrxvtrc \
	$(HOME)/.screenrc \
	$(HOME)/.ssh/config\
	$(HOME)/.wmiirc \
	$(HOME)/.Xdefaults \
	$(HOME)/.ackrc \
	$(HOME)/.Xmodmap \
	$(HOME)/.zshenv \
	$(HOME)/.zshrc \
	$(HOME)/.pentadactylrc \
	$(HOME)/.pylintrc \
	vim/bundle/vundle/.git \
	vim/undo/ \
	.installed_vundles

vim/bundle/vundle/.git:
	git submodule init
	git submodule update

.installed_vundles: vimrc vim/bundle/vundle/.git
	vim +BundleInstall +qall

$(HOME)/.%: %
	ln -fs $(abspath $<) $@

vim/undo/:
	mkdir -p vim/undo

$(HOME)/.ssh/config: ssh_config
	mkdir -p $(HOME)/.ssh
	ln -fs $(abspath $<) $@

python_vim/python.vim python_vim/vimrc:
	svn checkout http://svn.python.org/projects/python/trunk/Misc/Vim python_vim

vim/syntax/python.vim: python_vim/python.vim
	cd python_vim && svn up
	ln -s $(abspath $<) $@

