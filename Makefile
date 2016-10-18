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
	$(HOME)/.Xmodmap \
	$(HOME)/.zshenv \
	$(HOME)/.zshrc \
	$(HOME)/.pentadactylrc \
	$(HOME)/.pylintrc \
	$(HOME)/.jshintrc \
	$(HOME)/.tmux.conf \
	vim/bundle/neobundle.vim/.git \
	$(HOME)/.xonshrc \
	vim/undo/ \
	$(HOME)/bin/vv

vim/bundle/neobundle.vim/.git:
	git submodule init
	git submodule update

$(HOME)/bin/%: bin/%
	mkdir -p $(HOME)/bin
	ln -fs $(abspath $<) $@

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

