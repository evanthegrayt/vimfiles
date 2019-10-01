
if v:version > 701
  let &colorcolumn=join(range(81,272),",")
endif

vnoremap <leader>dbq :DB<cr>
nnoremap <leader>dbq vip:DB<cr>
setlocal previewheight=30

