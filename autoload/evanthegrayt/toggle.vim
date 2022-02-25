" Toggle foldcolumn
function! evanthegrayt#toggle#FoldColumn() abort
  if &foldcolumn
    setlocal foldcolumn=0
  else
    setlocal foldcolumn=2
  endif
endfunction

" Toggle the mouse between vim and terminal mode
function! evanthegrayt#toggle#Mouse() abort
  if !exists("l:old_mouse")
    let l:old_mouse = "a"
  endif
  if empty(&mouse)
    let &mouse = l:old_mouse
    echo "Mouse is for Vim (" . &mouse . ")."
  else
    let l:old_mouse = &mouse
    set mouse=
    echo "Mouse is for terminal."
  endif
endfunction

" Toggle a wide colorcolumn with \TC
function! evanthegrayt#toggle#ColorColumnWide(...) abort
  if empty(&colorcolumn) || (exists('a:1') && a:1 == 1)
    let &colorcolumn=join(range(81,100),",") .
          \ ',' . join(range(102,120),",") .
          \ ',' . join(range(122,272),",")
    setlocal nowrap
  else
    setlocal colorcolumn&
  endif
endfunction

" Toggle normal colorcolumns
function! evanthegrayt#toggle#ColorColumn(...) abort
  if empty(&colorcolumn) || (exists('a:1') && a:1 == 1)
    set colorcolumn=81,101,121
    setlocal nowrap
  else
    setlocal colorcolumn&
  endif
endfunction

" Toggle conceal level
function! evanthegrayt#toggle#Conceal() abort
  if &conceallevel == 2
    setlocal conceallevel=0
  else
    setlocal conceallevel=2
  endif
endfunction
