command! PackUpdate packadd minpac | source $MYVIMRC | redraw | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()

if !exists('*minpac#init')
    finish
endif

" Required:
packadd minpac
call minpac#init()

" Utility
call minpac#add('vim-scripts/L9')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-dispatch')
call minpac#add('tpope/vim-sleuth')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')

" Navigation
call minpac#add('mileszs/ack.vim')
call minpac#add('tpope/vim-vinegar')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf.vim')

" Filetypes
call minpac#add('fatih/vim-go')
call minpac#add('Firef0x/PKGBUILD.vim')
call minpac#add('pearofducks/ansible-vim')
call minpac#add('puppetlabs/puppet-syntax-vim')
call minpac#add('bracki/vim-prometheus')

" Text formatting
call minpac#add('junegunn/vim-easy-align')
call minpac#add('tpope/vim-commentary')
call minpac#add('sjl/gundo.vim')
call minpac#add('vim-scripts/VisIncr')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-abolish')  " Subvert

" vim notes
call minpac#add('xolox/vim-misc') | call minpac#add('xolox/vim-notes')

" Visual formatting
call minpac#add('w0rp/ale')

" Source control
call minpac#add('vim-scripts/vcscommand.vim')
call minpac#add('tpope/vim-fugitive')

" Shougo
"call minpac#add('Shougo/vimproc.vim', {'do': 'silent! !make'})

call minpac#add('Shougo/neocomplete.vim')
call minpac#add('SirVer/ultisnips') | call minpac#add('honza/vim-snippets')
