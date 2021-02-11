""
" CDC for vim. Might make this a plugin later.
function! evanthegrayt#cdc#ChangeDirectory(directory) abort
  for l:dir in g:cdc_dirs
    let l:path = l:dir . '/' . a:directory
    if isdirectory(l:path)
      execute "chdir" . l:path
      return
    endif
  endfor
  echo "Directory " . l:dir . " not found in g:cdc_dirs"
endfunction

function! evanthegrayt#cdc#Completion(...) abort
  let l:dirs = []
  for l:dir in g:cdc_dirs
    call add(l:dirs, map(
          \   glob(l:dir . '/*', 0, 1), "substitute(v:val, l:dir . '/', '', '')"
          \ ))
  endfor
  return join(sort(flatten(l:dirs)), "\n")
endfunction
