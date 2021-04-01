""
" Closes the REST response buffer. First checks for buffer-local variable,
" then global, then the default.
function! evanthegrayt#rest#CloseResponseBuffer() abort
  let l:buffer_name = get(
        \   b:, 'vrc_output_buffer_name',
        \   get(g:, 'vrc_output_buffer_name', '__REST_response__')
        \ )
  if bufexists(l:buffer_name) | exec 'bdelete ' . l:buffer_name | endif
endfunction
