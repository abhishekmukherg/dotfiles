if &compatible
    set nocompatible               " Be iMproved
endif

source ~/.vim/packages.vim

" {{{ Required:
filetype plugin indent on
syntax on
colorscheme Tomorrow-Night-Eighties
set background=dark
" }}}

let g:airline_powerline_fonts = 1

" {{{ Remap * and # to be smarter
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
" }}}

" {{{ Enable UTF-8 if applicable
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
" }}}

" {{{ Set up ripgrep
if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
  let g:ackprg = 'rg --vimgrep --no-heading'
endif
" }}}

" {{{ Common basic options
set laststatus=2
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
set completeopt=menu
set hlsearch
nnoremap <silent> <Space> :nohlsearch<CR>
set wildignore=*.o,*.pyc,*.pyo,*.class
set ruler
set wildmode=longest,list,full
set wildmenu
set scrolloff=4
set number
set nostartofline
set backspace=indent,eol,start
" }}}

" {{{ Persistent undo
if has('persistent_undo')
    set undofile
    set undodir=~/.vim/undo
endif
" }}}

" {{{ expand %% to be the currend directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" }}}

" {{{ Switch some mappings to be more to my taste
nnoremap ' `
nnoremap ` '
nnoremap 0 ^
nnoremap ^ 0
nnoremap <C-]> g<C-]>
nnoremap g<C-]> <C-]>
nnoremap Q gq
" }}}

" {{{ Disable help
noremap <F1> <nop>
" }}}

" {{{ junegunn/vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" }}}

" {{{ Dispatch configuration
nnoremap <Space>s :Start 
nnoremap cm :Make<CR>
nnoremap cd :Dispatch %:p<CR>
nnoremap cD :Dispatch<CR>
" }}}

" {{{ Qa command macro (help my fat fingers)
cnoreabbrev Qa qa
" }}}

" {{{ File navigation hotkeys (C-p)
nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffers<CR>
" }}}

" {{{ vim notes
let g:notes_directories = ['~/Sync/vim-notes/']
let g:notes_suffix = '.txt'
let g:notes_word_boundaries = 1
let g:notes_conceal_code = 0
let g:notes_conceal_italic = 0
let g:notes_conceal_bold = 0
" }}}


" {{{ GUndo toggle
function! MyGundoToggle()
  let g:gundo_width = &columns / 4
  GundoToggle
endfunction
nnoremap <leader>u :call MyGundoToggle()<CR>
let g:gundo_help = 0
" }}}

" {{{ VCS
"let g:VCSCommandCommitOnWrite = 0
"let g:VCSCommandSVNExec="svn.real --username webadmin --password webadmin --non-interactive"
let g:VCSCommandSVNExec="svntr"
" }}}


" {{{ invisible characters
set list
nnoremap <leader>l :set list!<CR>
"set listchars=tab:▸\ ,eol:¬
set listchars=tab:▸\ ,eol:\ 
highlight NonText ctermfg=darkgreen
highlight SpecialKey ctermfg=darkgreen
" }}}

" {{{ Set tabstop, softtabstop and shiftwidth to the same value
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
" }}}

" {{{ Local overrides
if filereadable(".vimrc_local")
  source .vimrc_local
endif
" }}}

" vim: set fdm=marker foldlevel=0:
