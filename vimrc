syntax on
set background=dark

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
  autocmd FileType python compiler pylint
  autocmd Filetype python set tabstop=4
  autocmd Filetype python set shiftwidth=4
  autocmd Filetype python set smarttab
  autocmd Filetype python set expandtab
  autocmd Filetype python set softtabstop=0
  autocmd Filetype python set autoindent
  
  autocmd BufEnter *   execute ":lcd " . expand("%:p:h") 
endif
augroup filetypedetect
  autocmd BufRead,BufNewFile *.wiki setfiletype wikipedia
  autocmd BufRead,BufNewFile *.wikipedia.org.* setfiletype wikipedia
  autocmd BufRead,BufNewFile *.gentoo-wiki.com.* setfiletype wikipedia
augroup END



if has("autocmd")
	autocmd FileType python set complete+=k/home/master/bin/pydiction-0.5/pydiction isk+=.,(
endif

if has("autocmd")
  filetype indent on
endif

filetype plugin on
set grepprg=grep\ -nH\ $*

set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set linebreak
set hidden             " Hide buffers when they are abandoned
" set mouse=a		" Enable mouse usage (all modes) in terminals
set foldmethod=syntax
set foldlevelstart=1
set nocp
set completeopt=menu
set nohlsearch
set wildignore=*.o,*.pyc,*.pyo

nnoremap Q gq

nnoremap <silent><F8> :make<CR><CR>
nnoremap <silent><F7> :copen<CR>
nnoremap <silent><C-F7> :cclose<CR>

set backspace=indent,eol,start 

" OmniCPPComplete
nnoremap <C-F11> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
let OmniCpp_DefaultNamespaces = ["std"]

" NetRW
let g:explVertical=1
let g:netrw_list_hide="\.pyc,\.swp"
nnoremap <F3> :Explore<CR>

let g:pylint_onwrite = 0

" VCS
let g:VCSCommandCommitOnWrite = 0
