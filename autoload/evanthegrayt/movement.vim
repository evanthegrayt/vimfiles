function! evanthegrayt#movement#BottomOfFileSameColumn() abort
  exec 'normal! G' . col('.') . '|'
endfunction

function! evanthegrayt#movement#TopOfFileSameColumn() abort
  exec 'normal! gg' . col('.') . '|'
endfunction
