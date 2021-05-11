function! evanthegrayt#modeline#Add(bang, count) abort
  if a:count > &modelines
    call evanthegrayt#Error(
          \   "Count exceeds '&modelines' (" . a:count . '/' . &modelines . ')'
          \ )
    return
  elseif a:count > line('$')
    call evanthegrayt#Error(
          \   'Count exceeds file length (' . a:count . '/' . line('$') . ')'
          \ )
    return
  endif
  let l:modeline = printf(" vim: ft=%s ts=%d sw=%d tw=%d %set :",
        \ &filetype, &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:line = a:bang ? (line('$') - a:count) : (0 + a:count)
  call append(l:line, printf(&commentstring, l:modeline))
  echo 'Modeline added at end of file.'
endfunction
