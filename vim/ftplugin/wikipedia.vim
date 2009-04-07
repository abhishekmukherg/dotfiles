setlocal fileencoding=utf-8
setlocal textwidth=0
setlocal linebreak
setlocal matchpairs+=<:>
setlocal comments=n:#,n:*,n:\:,s:{\|,m:\|,ex:\|} 
setlocal formatoptions=rol
noremap <buffer> k gk
noremap <buffer> j gj
noremap <buffer> <Up> gk
noremap <buffer> <Down> gj
noremap <buffer> 0 g0
noremap <buffer> ^ g^
noremap <buffer> $ g$
inoremap <buffer> <Up> <C-O>gk
inoremap <buffer> <Down> <C-O>gj

" match HTML tags (taken directly from $VIM/ftplugin/html.vim)
if exists("loaded_matchit")
    let b:match_ignorecase=0
    let b:match_skip = 's:Comment'
    let b:match_words = '<:>,' .
    \ '<\@<=[ou]l\>[^>]*\%(>\|$\):<\@<=li\>:<\@<=/[ou]l>,' .
    \ '<\@<=dl\>[^>]*\%(>\|$\):<\@<=d[td]\>:<\@<=/dl>,' .
    \ '<\@<=\([^/][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>'
endif

" Other useful mappings
" Insert a matching = automatically while starting a new header.
" inoremap <buffer> <silent> = <C-R>=(getline('.')==\|\|getline('.')=~'^=\+$')?"==\<Lt>Left>":"="<CR>

