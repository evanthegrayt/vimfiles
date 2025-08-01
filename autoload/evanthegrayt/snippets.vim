function! evanthegrayt#snippets#SnipComplete(...) abort
  let l:dir = expand('~/.vim/skeletons/')
  if !empty(&ft) | let l:dir .= &ft . '/' | endif
  if !isdirectory(l:dir) | return '' | endif
  let l:list = filter(glob(l:dir . '**/*', 0, 1), {_, val -> !isdirectory(val)})
  return join(map(l:list, {_, val -> substitute(val, l:dir, '', '')}), "\n")
endfunction

function! evanthegrayt#snippets#Snip(file) abort
  let l:file = expand($HOME . '/.vim/skeletons/' . &ft . '/' . a:file)
  if line('$') == 1 && getline(1) ==# ''
    let l:lines = readfile(l:file)
    return setline(1, l:lines)
  endif
  execute 'read ' . l:file
endfunction
