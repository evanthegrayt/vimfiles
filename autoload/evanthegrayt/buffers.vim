""
" List of active buffer names.
function! evanthegrayt#buffers#GetActiveBuffers() abort
  return map(filter(copy(getbufinfo()), 'v:val.listed'), 'v:val.name')
endfunction

""
" Opens buffers found in GetActiveBuffers() in graphical vim and closes
" current vim instance.
function! evanthegrayt#buffers#OpenInGui() abort
  let l:buffers = join(evanthegrayt#buffers#GetActiveBuffers(), ' ')
  execute 'bd' l:buffers
  execute 'silent !' get(g:, 'open_buffers_gui', 'mvim') l:buffers
  execute 'qa'
endfunction
