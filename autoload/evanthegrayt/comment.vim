" NOTE: This is quick and dirty, and can be greatly improved.
" This works for what I need at the moment though.
function evanthegrayt#comment#GetText() abort
  let l:comment_string = substitute(&commentstring, '\*', '\\*', 'g')
  let l:regex = substitute(l:comment_string, '%s', '\\s*\\zs.*\\ze\\s*', '')
  return matchstr(getline('.'), '\v'. l:regex)
endfunction
