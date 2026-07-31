function! s:rsi_ctrl_y() abort
  return wildmenumode() || pumvisible() ? "\<C-Y>" : "\<C-R>-"
endfunction

cnoremap <expr> <C-Y> <SID>rsi_ctrl_y()
