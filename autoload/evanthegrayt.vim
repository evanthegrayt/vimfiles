" Toggle foldcolumn
function! evanthegrayt#FoldColumnToggle() abort
  if &foldcolumn
    setlocal foldcolumn=0
  else
    setlocal foldcolumn=2
  endif
endfunction

" Toggle the mouse between vim and terminal mode
function! evanthegrayt#ToggleMouse() abort
  if !exists("l:old_mouse")
    let l:old_mouse = "a"
  endif
  if &mouse == ""
    let &mouse = l:old_mouse
    echo "Mouse is for Vim (" . &mouse . ")."
  else
    let l:old_mouse = &mouse
    let &mouse=""
    echo "Mouse is for terminal."
  endif
endfunction

" Toggle a wide colorcolumn with \TC
function! evanthegrayt#ToggleColorColumnWide(...) abort
  if &colorcolumn == "" || (exists('a:1') && a:1 == 1)
    let &colorcolumn=join(range(81,100),",") .
          \ ',' . join(range(102,120),",") .
          \ ',' . join(range(122,272),",")
    setlocal nowrap
  else
    setlocal colorcolumn&
  endif
endfunction

" Toggle normal colorcolumns
function! evanthegrayt#ToggleColorColumn(...) abort
  if &colorcolumn == "" || (exists('a:1') && a:1 == 1)
    set colorcolumn=81,101,121
    setlocal nowrap
  else
    setlocal colorcolumn&
  endif
endfunction

" Toggle conceal level
function! evanthegrayt#ToggleConceal() abort
  if &conceallevel == 2
    setlocal conceallevel=0
  else
    setlocal conceallevel=2
  endif
endfunction

" Append modeline after last line in buffer.
function! evanthegrayt#AppendModeline() abort
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction

" Show the syntax stack of keyword under the cursor.
function! evanthegrayt#SynStack() abort
  if !exists("*synstack") | return | endif

  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

function! evanthegrayt#RelativeNumberToggle() abort
  if &relativenumber
    call evanthegrayt#RelativeNumberDisable()
  else
    call evanthegrayt#RelativeNumberEnable()
  endif
endfunction

function! evanthegrayt#RelativeNumberEnable() abort
  set rnu
  augroup numbertoggles
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
  augroup END
endfunction

function! evanthegrayt#RelativeNumberDisable() abort
  set nornu
  augroup numbertoggles
    autocmd!
  augroup END
endfunction

""
" StandupMD. Might make this a plugin later.
function! evanthegrayt#StandupCompletion(...) abort
  let l:dir = get(g:, 'standup_dir', $HOME . '/.cache/standup_md') . '/'
  if !isdirectory(l:dir) | return '' | endif
  let l:list = glob(l:dir . '*.md', 0, 1)
  return join(map(l:list, "substitute(v:val, l:dir, '', '')"), "\n")
endfunction

function! evanthegrayt#OpenStandupFile(split, ...)
  let l:dir = get(g:, 'standup_dir', $HOME . '/.cache/standup_md') . '/'
  let l:file = a:0 ? a:1 : get(g:, 'standup_file', strftime('%Y_%m') . '.md')
  call system('standup --no-edit')
  execute a:split ? 'vsplit' : 'split' l:dir . l:file
endfunction

""
" CDC for vim. Might make this a plugin later.
function! evanthegrayt#ChangeDirectory(directory) abort
  for l:dir in g:cdc_dirs
    let l:path = l:dir . '/' . a:directory
    if isdirectory(l:path)
      execute "chdir" . l:path
      return
    endif
  endfor
  echo "Directory " . l:dir . " not found in g:cdc_dirs"
endfunction

function! evanthegrayt#CdcCompletion(...) abort
  let l:dirs = []
  for l:dir in g:cdc_dirs
    call add(l:dirs, map(
          \   glob(l:dir . '/*', 0, 1), "substitute(v:val, l:dir . '/', '', '')"
          \ ))
  endfor
  return join(sort(flatten(l:dirs)), "\n")
endfunction
