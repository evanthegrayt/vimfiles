function! evanthegrayt#relative_number#Toggle() abort
  if &relativenumber
    call evanthegrayt#relative_number#Disable()
  else
    call evanthegrayt#relative_number#Enable()
  endif
endfunction

function! evanthegrayt#relative_number#Enable() abort
  set rnu
  augroup numbertoggles
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
  augroup END
endfunction

function! evanthegrayt#relative_number#Disable() abort
  set nornu
  augroup numbertoggles
    autocmd!
  augroup END
endfunction
