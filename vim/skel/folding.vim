function! Folds()
    return "0"
endfunction
setlocal foldmethod=expr
setlocal foldexpr=Folds()
