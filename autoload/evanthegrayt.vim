" Append modeline after last line in buffer.
function! evanthegrayt#AppendModeline() abort
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
  echo 'Modeline added at end of file.'
endfunction

function! evanthegrayt#Warn(message) abort
  echohl WarningMsg | echo 'evanthegrayt: ' . a:message | echohl None
endfunction

function! evanthegrayt#Error(message) abort
  echohl ErrorMsg | echo 'evanthegrayt: ' . a:message | echohl None
endfunction
