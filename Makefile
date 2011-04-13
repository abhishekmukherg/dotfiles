all: $(HOME)/.vim \
	$(HOME)/.vimrc \
	vim/colors/inkpot.vim \
	vim/doc/surround.txt \
	vim/plugin/surround.vim \
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
	vim/ruby/command-t/ext.bundle vim/ruby/command-t/ext.o \
	vim/ruby/command-t/match.o vim/ruby/command-t/matcher.o \
	vim/bundle/gundo \
	vim/autoload/pathogen.vim

$(HOME)/.%: %
	ln -fs $(abspath $<) $@

$(HOME)/.ssh/config: ssh_config
	mkdir -p $(HOME)/.ssh
	ln -fs $(abspath $<) $@

vim/colors/inkpot.vim: inkpot/colors/inkpot.vim
	ln -fs $(abspath $<) $@

vim/doc/surround.txt: vim-surround/doc/surround.txt
	ln -fs $(abspath $<) $@

vim/plugin/surround.vim: vim-surround/plugin/surround.vim
	ln -fs $(abspath $<) $@


gundo.vim/README.markdown Command-T/Makefile vim-surround/doc/surround.txt vim-surround/plugin/surround.vim inkpot/colors/inkpot.vim vim-pathogen/autoload/pathogen.vim:
	git submodule init
	git submodule update

Command-T/command-t.vba: Command-T/Makefile
	grep ../mkvimball Command-T/Makefile || sed -i '' 's:mkvimball:../mkvimball:g' Command-T/Makefile
	$(MAKE) -C Command-T
	cd Command-T && git checkout -- Makefile

vim/ruby/command-t/Makefile: vim/ruby/command-t/extconf.rb
	cd $(dir $^) && ruby $(notdir $^)

vim/ruby/command-t/ext.bundle vim/ruby/command-t/ext.o vim/ruby/command-t/match.o vim/ruby/command-t/matcher.o: vim/ruby/command-t/Makefile
	$(MAKE) -C $(dir $^)

mkvimball:
	rm -rf /tmp/MKVIMBALL
	[[ -f /tmp/mkvimball.tar.gz ]] || curl -o /tmp/mkvimball.tar.gz 'http://mysite.verizon.net/astronaut/src/mkvimball.tar.gz'
	tar -C /tmp/ -xf /tmp/mkvimball.tar.gz
	$(MAKE) -C /tmp/MKVIMBALL
	cp /tmp/MKVIMBALL/mkvimball .

python_vim/python.vim python_vim/vimrc:
	svn checkout http://svn.python.org/projects/python/trunk/Misc/Vim python_vim

vim/syntax/python.vim: python_vim/python.vim
	ln -fs $(abspath $<) $@


vim/bundle/gundo: gundo.vim/README.markdown
	mkdir -p vim/bundle
	ln -fs $(abspath gundo.vim) $@

vim/autoload/pathogen.vim: vim-pathogen/autoload/pathogen.vim
	ln -fs $(abspath $<) $@
