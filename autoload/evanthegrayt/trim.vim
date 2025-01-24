function evanthegrayt#trim#ConsecutiveSpaces(start, end, confirm) abort
  let l:cmd = 's/\([^[:space:]]\)\zs \{2,}/ /g'
  if a:confirm | let l:cmd .= 'c' | endif
  execute a:start . ',' . a:end . ' ' . l:cmd
endfunction
