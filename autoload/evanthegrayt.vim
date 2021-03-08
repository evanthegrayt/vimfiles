function! evanthegrayt#Warn(message) abort
  echohl WarningMsg | echo 'evanthegrayt: ' . a:message | echohl None
endfunction

function! evanthegrayt#Error(message) abort
  echohl ErrorMsg | echo 'evanthegrayt: ' . a:message | echohl None
endfunction
