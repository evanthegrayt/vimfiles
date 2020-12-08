command! Sloc echo len(filter(getline(1, '$'), 'v:val =~# "\\S"'))
command! -bang Ri call ri#OpenSearchPrompt(<bang>0)

" TODO: This might be worth turning into a plugin.
if executable('standup')
  command! -complete=custom,s:StandupCompletion -nargs=? -bang Standup
        \ call s:OpenStandupFile(<bang>0, <f-args>)
endif

" private

function! s:StandupCompletion(...) abort
  let l:dir = get(g:, 'standup_dir', $HOME . '/.cache/standup_md') . '/'
  if !isdirectory(l:dir) | return '' | endif
  let l:list = glob(l:dir . '*.md', 0, 1)
  return join(map(l:list, "substitute(v:val, l:dir, '', '')"), "\n")
endfunction

function! s:OpenStandupFile(split, ...)
  let l:dir = get(g:, 'standup_dir', $HOME . '/.cache/standup_md') . '/'
  let l:file = a:0 ? a:1 : get(g:, 'standup_file', strftime('%Y_%m') . '.md')
  call system('standup --no-edit')
  execute a:split ? 'vsplit' : 'split' l:dir . l:file
endfunction
