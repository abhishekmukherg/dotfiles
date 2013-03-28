function! DiffFolds()
    let thisline = getline(v:lnum)
    if match(thisline, '^Index: ') >= 0
        return ">1"
    elseif v:lnum == 1
        return '-1'
    elseif thisline == '==================================================================='
        return "="
    elseif thisline =~ '^\(---\|+++\)'
        return "="
    elseif thisline =~ '^@@'
        return ">2"
    else
        let prevline = getline(v:lnum - 1)
        if thisline[0] == prevline[0]
            return "="
        else
            return ">3"
        endif
    endif
endfunction
setlocal foldmethod=expr
setlocal foldexpr=DiffFolds()

