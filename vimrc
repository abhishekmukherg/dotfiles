if &compatible
    set nocompatible               " Be iMproved
endif

source ~/.vim/packages.vim

" Required:
filetype plugin indent on
syntax on
colorscheme Tomorrow-Night-Eighties
set background=dark
set laststatus=2

let g:airline_powerline_fonts = 1

"if has("autocmd")
"  augroup gogroup
"    autocmd!
"    autocmd BufWrite *.go GoImports
"  augroup END
"  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
"    \| exe "normal g'\"" | endif
"  autocmd FileType python compiler pyunit
"  autocmd Filetype python set ts=4 sw=4 sta et sts=4 ai kp=pydoc isk=a-z,A-Z,48-57,_ tw=79
"  if exists('^colorcolumn')
"      autocmd FileType python set cc+=1
"  endif
"  autocmd Filetype go set ts=8 sw=8 sta noet sts=8 ai nolist
"
"  autocmd Filetype objc set tabstop=4
"  autocmd Filetype objc set shiftwidth=4
"  autocmd Filetype objc set smarttab
"  autocmd Filetype objc set expandtab
"  autocmd Filetype objc set softtabstop=0
"  autocmd Filetype objc set autoindent
"
"  autocmd Filetype javascript set tabstop=2
"  autocmd Filetype javascript set shiftwidth=2
"  autocmd Filetype javascript set smarttab
"  autocmd Filetype javascript set expandtab
"  autocmd Filetype javascript set softtabstop=0
"  autocmd Filetype javascript set autoindent
"
"  autocmd Filetype ruby set tabstop=2
"  autocmd Filetype ruby set shiftwidth=2
"  autocmd Filetype ruby set smarttab
"  autocmd Filetype ruby set expandtab
"  autocmd Filetype ruby set softtabstop=2
"  autocmd Filetype ruby set autoindent
"
"  autocmd BufRead Jenkinsfile setfiletype groovy
"
"  autocmd Filetype html set tabstop=2
"  autocmd Filetype html set shiftwidth=2
"  autocmd Filetype html set smarttab
"  autocmd Filetype html set expandtab
"  autocmd Filetype html set softtabstop=2
"  autocmd Filetype html set autoindent
"  autocmd Filetype htmldjango set tabstop=2
"  autocmd Filetype htmldjango set shiftwidth=2
"  autocmd Filetype htmldjango set smarttab
"  autocmd Filetype htmldjango set expandtab
"  autocmd Filetype htmldjango set softtabstop=2
"  autocmd Filetype htmldjango set autoindent
"
"  autocmd Filetype java set tabstop=4
"  autocmd Filetype java set shiftwidth=4
"  autocmd Filetype java set smarttab
"  autocmd Filetype java set expandtab
"  autocmd Filetype java set softtabstop=4
"  autocmd Filetype java set makeprg=ant\ -emacs\ jar-tr
"  autocmd Filetype java set autoindent
"  autocmd Filetype java setlocal omnifunc=javacomplete#Complete
"
"  autocmd Filetype velocity set tabstop=2
"  autocmd Filetype velocity set shiftwidth=2
"  autocmd Filetype velocity set smarttab
"  autocmd Filetype velocity set expandtab
"  autocmd Filetype velocity set softtabstop=2
"  autocmd Filetype velocity set autoindent
"  autocmd BufWritePost *.vm silent !$TRTOP/scripts/tweak flush velocity >/dev/null 2>&1 &
"
"  autocmd Filetype css set tabstop=2
"  autocmd Filetype css set shiftwidth=2
"  autocmd Filetype css set smarttab
"  autocmd Filetype css set expandtab
"  autocmd Filetype css set softtabstop=2
"  autocmd Filetype css set autoindent
"  autocmd Filetype css nnoremap <leader>r :s/{\s*/{\r/:s/;\s*/;\r/g:set nohlskV'.>
"
"  autocmd Filetype java nnoremap <silent> <buffer> <leader>i :JavaImport<cr>
"  autocmd Filetype java nnoremap <silent> <buffer> <leader>d :JavaDocSearch -x declarations<cr>
"  autocmd Filetype java nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>
"
"  autocmd Filetype rst nnoremap <silent> <buffer> <leader>h yypVr
"
"  autocmd BufNewFile folding.vim 0r ~/.vim/skel/folding.vim
"  autocmd BufNewFile docker-compose.yml 0r ~/.vim/skel/docker-compose.yml
"
"  au BufRead,BufNewFile *.go     setfiletype go
"
"  au BufNewFile,BufRead *.gradle setf groovy
"  autocmd Filetype groovy set ts=4 sts=4 et formatoptions+=ro ai tw=80
"  autocmd Filetype yaml set ts=2 sts=2 sw=2 et formatoptions+=ro ai
"  au BufNewFile,BufRead proguard.cfg setf proguard
"
"  autocmd FileType puppet set ts=2 sts=2 sw=2 et
"endif

vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

"let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
"let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

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
if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
  let g:ackprg = 'rg --vimgrep --no-heading'
endif

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
set foldlevelstart=2
set nocp
set completeopt=menu
set hlsearch
nnoremap <silent> <Space> :nohlsearch<CR>
set wildignore=*.o,*.pyc,*.pyo,*.class
set ruler
set wildmode=longest,list,full
set wildmenu
set scrolloff=4
set number
"set relativenumber
set nostartofline

if has('persistent_undo')
    set undofile
    set undodir=~/.vim/undo
endif

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

nnoremap <Space>s :Start 
nnoremap ' `
nnoremap ` '
nnoremap 0 ^
nnoremap ^ 0
nnoremap <C-]> g<C-]>
nnoremap g<C-]> <C-]>

noremap <F1> <nop>

" junegunn/vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Dispatch configuration
nnoremap cm :Make<CR>
nnoremap cd :Dispatch %:p<CR>
nnoremap cD :Dispatch<CR>

nnoremap Q gq

cnoreabbrev Qa qa

"nnoremap <silent><C-j> gj
"nnoremap <silent><C-k> gk

nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap g* *#:s//

nnoremap sip gg/^import <CR>VG?^import <CR>!~/bin/eclipsepackagesort<CR>:nohls<CR>

nnoremap [[ ?{<CR>w99[{
nnoremap ][ /}<CR>b99]}
nnoremap ]] j0[[%/{<CR>
nnoremap [] k$][%?}<CR>

nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffers<CR>

set backspace=indent,eol,start

" vim notes
let g:notes_directories = ['~/Sync/vim-notes/']
let g:notes_suffix = '.txt'
let g:notes_word_boundaries = 1
let g:notes_conceal_code = 0
let g:notes_conceal_italic = 0
let g:notes_conceal_bold = 0


" miniBufExplorer
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1

function! MyGundoToggle()
  let g:gundo_width = &columns / 4
  GundoToggle
endfunction
nnoremap <leader>u :call MyGundoToggle()<CR>
let g:gundo_help = 0

" VCS
"let g:VCSCommandCommitOnWrite = 0
"let g:VCSCommandSVNExec="svn.real --username webadmin --password webadmin --non-interactive"
let g:VCSCommandSVNExec="svntr"


" invisible characters
set list
nnoremap <leader>l :set list!<CR>
"set listchars=tab:▸\ ,eol:¬
set listchars=tab:▸\ ,eol:\ 
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

if filereadable(".vimrc_local")
  source .vimrc_local
endif
