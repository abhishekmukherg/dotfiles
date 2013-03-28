set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'LargeFile'
Bundle 'ciaranm/inkpot'
Bundle 'tpope/vim-surround'
Bundle 'L9'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-pathogen'
Bundle 'linkinpark342/vimpager'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'msanders/snipmate.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'mrtazz/simplenote.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'gmarik/vundle'
Bundle 'bufexplorer.zip'
Bundle 'matchit.zip'
Bundle 'JavaScript-Indent'
Bundle 'Align'
Bundle 'tetsuo13/Vim-log4j'
Bundle 'VisIncr'
Bundle 'scrooloose/nerdtree'
Bundle 'rson/vim-conque'
Bundle 'ivanov/vim-ipython'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'groenewege/vim-less'
"Bundle 'tomtom/quickfixsigns_vim'
"Bundle 'tomtom/checksyntax_vim'
Bundle 'scrooloose/syntastic'
Bundle 'git://repo.or.cz/vcscommand'
Bundle 'ShowMarks'
Bundle 'Tab-Name'
Bundle 'linkinpark342/vim-g'
Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'

filetype plugin indent on

syntax on
colorscheme solarized
set background=dark

set ts=4
set sts=4
set sw=4
set et

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
"  autocmd FileType python compiler pylint
  autocmd Filetype python set tabstop=4
  autocmd Filetype python set shiftwidth=4
  autocmd Filetype python set smarttab
  autocmd Filetype python set expandtab
  autocmd Filetype python set softtabstop=0
  autocmd Filetype python set autoindent
  autocmd Filetype python set keywordprg=pydoc
  autocmd Filetype python set iskeyword=a-z,A-Z,48-57,_

  autocmd Filetype objc set tabstop=4
  autocmd Filetype objc set shiftwidth=4
  autocmd Filetype objc set smarttab
  autocmd Filetype objc set expandtab
  autocmd Filetype objc set softtabstop=0
  autocmd Filetype objc set autoindent

  autocmd Filetype javascript set tabstop=4
  autocmd Filetype javascript set shiftwidth=4
  autocmd Filetype javascript set smarttab
  autocmd Filetype javascript set expandtab
  autocmd Filetype javascript set softtabstop=0
  autocmd Filetype javascript set autoindent

  autocmd Filetype ruby set tabstop=2
  autocmd Filetype ruby set shiftwidth=2
  autocmd Filetype ruby set smarttab
  autocmd Filetype ruby set expandtab
  autocmd Filetype ruby set softtabstop=2
  autocmd Filetype ruby set autoindent

  autocmd Filetype html set tabstop=2
  autocmd Filetype html set shiftwidth=2
  autocmd Filetype html set smarttab
  autocmd Filetype html set expandtab
  autocmd Filetype html set softtabstop=2
  autocmd Filetype html set autoindent
  autocmd Filetype htmldjango set tabstop=2
  autocmd Filetype htmldjango set shiftwidth=2
  autocmd Filetype htmldjango set smarttab
  autocmd Filetype htmldjango set expandtab
  autocmd Filetype htmldjango set softtabstop=2
  autocmd Filetype htmldjango set autoindent

  autocmd Filetype java set tabstop=4
  autocmd Filetype java set shiftwidth=4
  autocmd Filetype java set smarttab
  autocmd Filetype java set expandtab
  autocmd Filetype java set softtabstop=4
  autocmd Filetype java set makeprg=ant\ -emacs\ jar-tr
  autocmd Filetype java set autoindent
  autocmd Filetype java setlocal omnifunc=javacomplete#Complete

  autocmd Filetype velocity set tabstop=2
  autocmd Filetype velocity set shiftwidth=2
  autocmd Filetype velocity set smarttab
  autocmd Filetype velocity set expandtab
  autocmd Filetype velocity set softtabstop=2
  autocmd Filetype velocity set autoindent
  autocmd BufWritePost *.vm silent !$TRTOP/scripts/tweak flush velocity >/dev/null 2>&1 &

  autocmd Filetype css set tabstop=2
  autocmd Filetype css set shiftwidth=2
  autocmd Filetype css set smarttab
  autocmd Filetype css set expandtab
  autocmd Filetype css set softtabstop=2
  autocmd Filetype css set autoindent
  autocmd Filetype css nnoremap <leader>r :s/{\s*/{\r/:s/;\s*/;\r/g:set nohlskV'.>

  autocmd Filetype java nnoremap <silent> <buffer> <leader>i :JavaImport<cr>
  autocmd Filetype java nnoremap <silent> <buffer> <leader>d :JavaDocSearch -x declarations<cr>
  autocmd Filetype java nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>

  autocmd Filetype rst nnoremap <silent> <buffer> <leader>h yypVr

  autocmd BufNewFile folding.vim 0r ~/.vim/skel/folding.vim

endif

"let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
"let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

if has("autocmd")
  filetype indent on
  filetype plugin on
endif

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  set termencoding=utf-8
  setglobal fileencoding=utf-8 
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif
set grepprg=grep\ -nH\ $*

let maplocalleader = ","

"set autochdir
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set linebreak
set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes) in terminals
set modelines=2
set foldmethod=syntax
set foldlevelstart=1
set nocp
set completeopt=menu
set hlsearch
nnoremap <silent> <Space> :nohlsearch<CR>
set wildignore=*.o,*.pyc,*.pyo
set ruler
set wildmode=longest,list,full
set wildmenu
set undofile
set undodir=~/.vim/undo
set scrolloff=4
set number
set nostartofline

nnoremap ' `
nnoremap ` '
nnoremap 0 ^
nnoremap ^ 0
nnoremap <C-]> g<C-]>
nnoremap g<C-]> <C-]>

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

noremap <F1> <nop>

" Make :w!! automatically write as sudo
"cnoremap w!! %!sudo tee > /dev/null %
"command! -nargs=0 w!! call Suwrite()
function! Suwrite()
	%!sudo tee >/dev/null %
endfunction

nnoremap Q gq

nnoremap <silent><F8> :make<CR><CR>
nnoremap <silent><F7> :copen<CR>
nnoremap <silent><C-F7> :cclose<CR>
nnoremap <silent><F6> :lopen<CR>
nnoremap <silent><C-F6> :lclose<CR>
nnoremap <C-q> :CheckSyntax<CR>
cnoreabbrev Qa qa

"nnoremap <silent><C-j> gj
"nnoremap <silent><C-k> gk

nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>
nnoremap <leader>w :bw<CR>
nnoremap <leader>P :set paste!<CR>:set paste?<CR>
nnoremap g* *#:s//

nnoremap <leader>C :ConqueTermSplit zsh<CR>

nnoremap sip gg/^import <CR>VG?^import <CR>!~/bin/eclipsepackagesort<CR>:nohls<CR>

nnoremap [[ ?{<CR>w99[{
nnoremap ][ /}<CR>b99]}
nnoremap ]] j0[[%/{<CR>
nnoremap [] k$][%?}<CR>

inoremap <C-R><Delete> <C-R>+

set backspace=indent,eol,start 

runtime macros/matchit.vim

" NERD tree
nnoremap <silent> <leader>e :NERDTreeToggle<CR>
nnoremap <silent> <leader>E :NERDTree %:h<CR>
let NERDTreeQuitOnOpen = 1

" NERD Commenter
vmap # <plug>NERDCommenterToggle


" OmniCPPComplete
nnoremap <C-F11> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
let OmniCpp_DefaultNamespaces = ["std"]

" NetRW
let g:explVertical=1
let g:netrw_list_hide="\.pyc,\.swp"
nnoremap <F3> :Explore<CR>

" miniBufExplorer
"let g:miniBufExplMapWindowNavVim = 1 
"let g:miniBufExplMapWindowNavArrows = 1 
"let g:miniBufExplMapCTabSwitchBufs = 1 
"let g:miniBufExplModSelTarget = 1 

let g:pylint_onwrite = 0

let g:alternateExtensions_m = "h"
let g:alternateExtensions_h = "m"
let g:EasyMotion_leader_key = ','

function! MyGundoToggle()
  let g:gundo_width = &columns / 4
  GundoToggle
endfunction
nnoremap <leader>u :call MyGundoToggle()<CR>
let g:gundo_help = 0

nnoremap <leader>q ?['"]<CR>lv//s-1<CR>y:r!trans value <C-R>"<CR>I## <ESC>kJ:nohlsearch<CR>

" VCS
let g:VCSCommandCommitOnWrite = 0
let g:VCSCommandSVNExec="svn.real --username webadmin --password webadmin --non-interactive"

" VisIncr
vnoremap <c-a> :I<CR>

runtime ftplugin/man.vim

" Command-T
let g:CommandTMaxHeight = 10

" invisible characters
set list
nnoremap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬
highlight NonText ctermfg=darkgreen
highlight SpecialKey ctermfg=darkgreen

let g:js_indent_log = 0

" Set tabstop, softtabstop and shiftwidth to the same value
function! Stab(size, ...)
  if a:size > 0
    let &l:sts = a:size
    let &l:ts = a:size
    let &l:sw = a:size
  endif
  if a:0 >= 1
	Error 'foo'
    exec('set ' + a:1)
  endif
  call SummarizeTabs()
endfunction
command! -nargs=+ Stab call Stab(<q-args>)

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

if (filereadable(expand('~/.simplenoterc')))
  source ~/.simplenoterc
endif

nnoremap <leader>f :FufFile<CR>

" Syntastic
let g:syntastic_javascript_checker="jshint"
set statusline=%<%f\ %h%m%r(%n)%#warningmsg#%{SyntasticStatuslineFlag()}%*%=%-14.(%l,%c%V%)\ %P 

" CScope
" add any cscope database in current directory
if filereadable("cscope.out")
    cs add cscope.out  
" else add the database pointed to by environment variable 
elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
endif
nnoremap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nnoremap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nnoremap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR> 

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Eclim
let g:EclimJavaSearchSingleResult="edit"
let g:EclimValidateSortResults="severity"
let g:EclimXmlValidate=0

highlight ShowMarksHLl ctermfg=Black ctermbg=241
highlight ShowMarksHLo ctermfg=Black ctermbg=241
let showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.'`^<>[]\""
nnoremap mm :ShowMarksPlaceMark<CR>

au FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
  exe "wincmd J"
endfunction
autocmd QuickFixCmdPost [^l]* nested cwindow

"CTRL-P
set wildignore+=_build
let g:ctrlp_max_files = 300000
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_lazy_update=1
nnoremap <C-B> :CtrlPBuffer<CR>

if filereadable(".vimrc_local")
  source .vimrc_local
endif

function! AutoCss()
  autocmd BufWritePost *.css silent make -C $TRTOP/site/css2/mobile >/dev/null 2>&1 &
endfunction
