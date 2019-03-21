if system('uname') =~ 'Darwin'
  nnoremap <silent> <leader>P :!open % <CR>
else
  nnoremap <silent> <leader>P :!firefox % <CR>
endif

