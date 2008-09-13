syntax on
set background=dark

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
  autocmd FileType python compiler pylint
  autocmd Filetype python set tabstop=4
  autocmd Filetype python set shiftwidth=4
  autocmd Filetype python set smarttab
  autocmd Filetype python set noexpandtab
  autocmd Filetype python set softtabstop=0
  autocmd Filetype python set autoindent
endif

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
set nocp
set completeopt=menu
set nohlsearch
set wildignore=*.o,*.pyc

nnoremap <silent><F8> :make<CR><CR>
nnoremap <silent><F7> :copen<CR>
nnoremap <silent><C-F7> :cclose<CR>

let g:explVertical=1
let g:netrw_list_hide="\.pyc,\.swp"
map <F3> <Esc><Esc>:Explore<CR>

let g:pylint_onwrite = 0

nmap <S-Space> <PageUp>
