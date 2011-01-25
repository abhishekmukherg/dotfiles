syntax on
set background=dark
colorscheme Dark2

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
  autocmd Filetype python set enc=utf-8
  autocmd Filetype python set keywordprg=pydoc
  autocmd Filetype python set iskeyword=a-z,A-Z,48-57,_,.

  autocmd Filetype objc set tabstop=4
  autocmd Filetype objc set shiftwidth=4
  autocmd Filetype objc set smarttab
  autocmd Filetype objc set expandtab
  autocmd Filetype objc set softtabstop=0
  autocmd Filetype objc set autoindent
  autocmd Filetype objc set enc=utf-8

  autocmd Filetype javascript set tabstop=4
  autocmd Filetype javascript set shiftwidth=4
  autocmd Filetype javascript set smarttab
  autocmd Filetype javascript set expandtab
  autocmd Filetype javascript set softtabstop=0
  autocmd Filetype javascript set autoindent
  autocmd Filetype javascript set enc=utf-8

  autocmd Filetype ruby set tabstop=2
  autocmd Filetype ruby set shiftwidth=2
  autocmd Filetype ruby set smarttab
  autocmd Filetype ruby set expandtab
  autocmd Filetype ruby set softtabstop=2
  autocmd Filetype ruby set autoindent
  autocmd Filetype ruby set enc=utf-8

  autocmd Filetype java set tabstop=4
  autocmd Filetype java set shiftwidth=4
  autocmd Filetype java set smarttab
  autocmd Filetype java set expandtab
  autocmd Filetype java set softtabstop=4
  autocmd Filetype java set autoindent
  autocmd Filetype java set enc=utf-8
  autocmd Filetype java setlocal omnifunc=javacomplete#Complete

  autocmd BufRead ~/Packages/adrastos/* set tabstop=4
  autocmd BufRead ~/Packages/adrastos/* set shiftwidth=4
  autocmd BufRead ~/Packages/adrastos/* set expandtab

  autocmd Filetype velocity set tabstop=2
  autocmd Filetype velocity set shiftwidth=2
  autocmd Filetype velocity set smarttab
  autocmd Filetype velocity set expandtab
  autocmd Filetype velocity set softtabstop=2
  autocmd Filetype velocity set autoindent
  autocmd Filetype velocity set enc=utf-8

  autocmd Filetype css set tabstop=2
  autocmd Filetype css set shiftwidth=2
  autocmd Filetype css set smarttab
  autocmd Filetype css set expandtab
  autocmd Filetype css set softtabstop=2
  autocmd Filetype css set autoindent
  autocmd Filetype css set enc=utf-8


  autocmd Filetype java nnoremap <silent> <buffer> <leader>i :JavaImport<cr>
  autocmd Filetype java nnoremap <silent> <buffer> <leader>d :JavaDocSearch -x declarations<cr>
  autocmd Filetype java nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>
endif
augroup filetypedetect
  autocmd BufRead,BufNewFile psql.edit.* setfiletype sql
  autocmd BufRead,BufNewFile *.wiki setfiletype wikipedia
  autocmd BufRead,BufNewFile *.wikipedia.org.* setfiletype wikipedia
  autocmd BufRead,BufNewFile *.gentoo-wiki.com.* setfiletype wikipedia
augroup END
"let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
"let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

if has("autocmd")
	autocmd FileType python set complete+=k/home/master/bin/pydiction-0.5/pydiction isk+=.,(
endif

if has("autocmd")
  filetype indent on
endif

filetype plugin on
set grepprg=grep\ -nH\ $*

set autochdir
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set linebreak
set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes) in terminals
set foldmethod=syntax
set foldlevelstart=1
set nocp
set completeopt=menu
set nohlsearch
set wildignore=*.o,*.pyc,*.pyo
set ruler

nnoremap Q gq

nnoremap <silent><F8> :make<CR><CR>
nnoremap <silent><F7> :copen<CR>
nnoremap <silent><C-F7> :cclose<CR>
nnoremap <silent><F6> :lopen<CR>
nnoremap <silent><C-F6> :lclose<CR>

set backspace=indent,eol,start 

runtime macros/matchit.vim

" Taglist
nnoremap <silent> <leader>t :TlistToggle<CR><C-w>h
let Tlist_Inc_Winwidth=0
let Tlist_Exit_OnlyWindow=1
let Tlist_Close_On_Select=1
let Tlist_Highlight_Tag_On_BufEnter=1

" NERD tree
nnoremap <silent> <leader>n :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1


" OmniCPPComplete
nnoremap <C-F11> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
let OmniCpp_DefaultNamespaces = ["std"]

" NetRW
let g:explVertical=1
let g:netrw_list_hide="\.pyc,\.swp"
nnoremap <F3> :Explore<CR>

" miniBufExplorer
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 

let g:pylint_onwrite = 0

let g:alternateExtensions_m = "h"
let g:alternateExtensions_h = "m"

nnoremap <leader>l :set list!<CR>

" VCS
let g:VCSCommandCommitOnWrite = 0

" VisIncr
vnoremap <c-a> :I<CR>

" invisible characters
set list
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬
highlight NonText ctermfg=0
highlight SpecialKey ctermfg=0

" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction
