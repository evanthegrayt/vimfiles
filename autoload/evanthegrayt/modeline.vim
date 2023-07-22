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
  let l:phrase = a:count ? (a:count . ' lines from') : 'to'
  let l:top_or_bottom = a:bang ? 'bottom' : 'top'
  echo 'Modeline added ' . l:phrase . ' ' . l:top_or_bottom . ' of file.'
endfunction
