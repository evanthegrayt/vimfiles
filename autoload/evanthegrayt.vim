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
