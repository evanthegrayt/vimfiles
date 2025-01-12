function! evanthegrayt#sloc#CountSloc() abort
  let l:loc = 0
  let l:comment_pattern = substitute(&commentstring, '%s', '.*', '')

  for l:line in getline(1, '$')
    let l:trimmed_line = trim(l:line)

    if empty(l:trimmed_line)
      continue
    endif

    if match(l:trimmed_line, '^' . l:comment_pattern) != -1
      continue
    endif

    let l:loc += 1
  endfor

  echo "Lines of Code (excluding blanks and comments): " . l:loc
endfunction
