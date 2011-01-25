all: $(HOME)/.vim vim/colors/inkpot.vim
$(HOME)/.vim: vim
	ln -s $(abspath $<) $@

vim/inkpot.vim: inkpot/colors/inkpot.vim
	ln -s $(abspath $<) $@


inkpot/colors/inkpot.vim:
	git submodule init
	git submodule update
