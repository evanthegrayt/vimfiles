
if v:version > 701
  call ToggleColorColumn()
endif

" DadBod stuff
vnoremap <silent><leader>dbq :DB<cr>
nnoremap <silent><leader>dbq vip:DB<cr>
nnoremap <silent><leader>dbd :Dotenv .env.development<cr>
nnoremap <silent><leader>dbp :Dotenv .env.production<cr>:echom "PRODUCTION!"<cr>
setlocal previewheight=30

setlocal tabstop=2 shiftwidth=2 softtabstop=2
