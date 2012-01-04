all: $(HOME)/.vim \
	$(HOME)/.vimrc \
	vim/colors/inkpot.vim \
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
	vim/bundle/surround \
	vim/bundle/command-t \
	vim/bundle/gundo \
	vim/bundle/solarized \
	vim/bundle/easymotion \
	vim/bundle/snipmate \
	vim/bundle/nerdcommenter \
	vim/autoload/pathogen.vim \
	$(HOME)/bin/vimpager

$(HOME)/.%: %
	ln -fs $(abspath $<) $@

$(HOME)/.ssh/config: ssh_config
	mkdir -p $(HOME)/.ssh
	ln -fs $(abspath $<) $@

define symlink-folder
[[ -e $@ ]] && touch $@ || ln -fs $(abspath $(dir $<)) $@
endef

vim/colors/inkpot.vim: inkpot/colors/inkpot.vim
	ln -fs $(abspath $<) $@

vim/bundle/surround: vim-surround/.git
	$(symlink-folder)

vim/bundle/solarized: solarized/.git
	$(symlink-folder)

vim/bundle/easymotion: vim-easymotion/.git
	$(symlink-folder)

vim/bundle/command-t: Command-T/.git
	$(symlink-folder)

gundo.vim/README.markdown Command-T/Makefile vim-surround/doc/surround.txt vim-surround/plugin/surround.vim inkpot/colors/inkpot.vim vim-pathogen/autoload/pathogen.vim solarized/.git vimpager/vimpager snipmate.vim/.git nerdcommenter/.git:
	git submodule init
	git submodule update

python_vim/python.vim python_vim/vimrc:
	svn checkout http://svn.python.org/projects/python/trunk/Misc/Vim python_vim

vim/syntax/python.vim: python_vim/python.vim
	ln -fs $(abspath $<) $@

vim/bundle/gundo: gundo.vim/README.markdown
	$(symlink-folder)

vim/bundle/snipmate: snipmate.vim/.git
	$(symlink-folder)

vim/bundle/nerdcommenter: nerdcommenter/.git
	$(symlink-folder)

vim/autoload/pathogen.vim: vim-pathogen/autoload/pathogen.vim
	ln -fs $(abspath $<) $@

$(HOME)/bin/vimpager: vimpager/vimpager
	ln -fs $(abspath $<) $@
