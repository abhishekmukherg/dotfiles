function! ShowDoc(name)
  enew
  execute "read !pydoc " . a:name
  setlocal nomodifiable
  setlocal nomodified
  set filetype=man
  normal 1G
endfunction
map <buffer> <silent> +m :call ShowDoc("<C-R><C-W>")<CR>
