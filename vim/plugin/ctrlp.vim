"CTRL-P
set wildignore+=_build
set wildignore+=eggs
set wildignore+=bin
set wildignore+=build
let g:ctrlp_max_files = 300000
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_lazy_update=1
let g:ctrlp_working_path_mode = 'raw'
nnoremap <C-B> :CtrlPBuffer<CR>
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'
if has("python") || has("python3")
    let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif
