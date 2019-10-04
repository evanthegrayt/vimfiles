
if v:version > 701
  let &colorcolumn=join(range(81,272),",")
endif

vnoremap <silent><leader>dbq :DB<cr>
nnoremap <silent><leader>dbq vip:DB<cr>
setlocal previewheight=30

