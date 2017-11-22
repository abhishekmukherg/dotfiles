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
	vim/undo/ \
	$(HOME)/bin/vv \
	$(HOME)/.config/nvim

$(HOME)/.config/nvim:
	mkdir -p $(HOME)/.config
	ln -s "../.vim" $@

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

vim/pack/tomorrow/start/theme/colors/Tomorrow-Night-Eighties.vim:
	mkdir -p $(dir $@)
	curl -L https://raw.githubusercontent.com/chriskempson/tomorrow-theme/master/vim/colors/Tomorrow-Night-Eighties.vim -o $@
