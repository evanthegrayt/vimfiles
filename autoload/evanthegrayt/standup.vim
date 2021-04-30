""
" Wrapper for my StandupMD gem. Might make this into a plugin later.
function! evanthegrayt#standup#Completion(...) abort
  if !s:Validate() | return | endif
  let l:dir = get(g:, 'standup_dir', $HOME . '/.cache/standup_md') . '/'
  if !isdirectory(l:dir) | return '' | endif
  return join(map(glob(l:dir . '*.md', 0, 1), "fnamemodify(v:val, ':t')"), "\n")
endfunction

function! evanthegrayt#standup#OpenFile(split, ...) abort
  if !s:Validate() | return | endif
  let l:dir = get(g:, 'standup_dir', $HOME . '/.cache/standup_md') . '/'
  let l:file = a:0 ? a:1 : get(g:, 'standup_file', strftime('%Y_%m') . '.md')
  call system('standup --no-edit')
  execute a:split ? 'vsplit' : 'split' l:dir . l:file
endfunction

function! s:Validate() abort
  if !executable('standup')
    call evanthegrayt#Error("StandupMD is required. `gem install standup_md`")
    return v:false
  endif
  return v:true
endfunction
