function! evanthegrayt#Warn(message) abort
  echohl WarningMsg | echo 'evanthegrayt: ' . a:message | echohl None
  return v:true
endfunction

function! evanthegrayt#Error(message) abort
  echohl ErrorMsg | echo 'evanthegrayt: ' . a:message | echohl None
  return v:false
endfunction
