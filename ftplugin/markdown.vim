setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=80 spell spelllang=en_us

" MARKDOWN: markdown syntax plugin
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_folding_disabled = 1

" PREVIM: live preview markdown, etc.
if !exists('g:previm_open_cmd')
  let g:previm_open_cmd =
        \ system('uname -s') =~# 'Darwin' ? 'open -a Firefox' : 'firefox'
endif
