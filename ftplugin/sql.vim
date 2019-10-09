
if v:version > 701
  let &colorcolumn=join(range(81,272),",")
endif

" DadBod stuff
vnoremap <silent><leader>dbq :DB<cr>
nnoremap <silent><leader>dbq vip:DB<cr>
nnoremap <silent><leader>dbd :Dotenv .env.development<cr>
nnoremap <silent><leader>dbp :Dotenv .env.production<cr>:echom "PRODUCTION!"<cr>
setlocal previewheight=30

