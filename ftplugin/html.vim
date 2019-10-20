let s:host = system('uname -s')
if s:host =~ 'Darwin'
  nnoremap <silent> <leader>P :!open % <CR>
elseif s:host =~ 'Linux'
  nnoremap <silent> <leader>P :!firefox % <CR>
endif

