" REST CONSOLE: Http client
let g:vrc_response_default_content_type = 'applicationjson'
" let g:vrc_split_request_body = 1
let g:vrc_curl_opts = {
      \ '-i': ''
      \ }
let g:vrc_set_default_mapping = 0
nnoremap <silent> <Leader>j :call VrcQuery()<CR>
