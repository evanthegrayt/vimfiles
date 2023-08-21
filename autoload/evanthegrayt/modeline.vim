function! evanthegrayt#modeline#Add(bang, count) abort
  if a:count > &modelines
    return evanthegrayt#Error(
          \   'Count exceeds &modelines (' . a:count . '/' . &modelines . ')'
          \ )
  elseif a:count > line('$')
    return evanthegrayt#Error(
          \   'Count exceeds file length (' . a:count . '/' . line('$') . ')'
          \ )
  endif
  let l:modeline = printf(" vim: ft=%s ts=%d sw=%d tw=%d %set :",
        \ &filetype, &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:line = a:bang ? (line('$') - a:count) : a:count
  call append(l:line, printf(&commentstring, l:modeline))
  echo 'Modeline added '
        \ . (a:count ? (a:count . ' lines from') : 'to')
        \ . ' '
        \ . (a:bang ? 'bottom' : 'top')
        \ . ' of file.'
endfunction
