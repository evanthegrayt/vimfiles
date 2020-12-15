" REST CONSOLE: Http client
let g:vrc_curl_opts = {'-i': '', '-s': ''}
let g:vrc_set_default_mapping = 0
nnoremap <silent> <buffer> <Leader>rq :call VrcQuery()<CR>
