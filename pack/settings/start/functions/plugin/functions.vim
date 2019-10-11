" FUNCTION TO TOGGLE LINE NUMBERING
function! NumberToggle()
  if(&rnu == 0 && &nu == 0)
    setlocal nu
  elseif(&nu == 1)
    setlocal nonu
    setlocal rnu
  else
    setlocal nornu
  endif
endfunction

" FUNCTION TO TOGGLE FOLDCOLUMN
function! FoldColumnToggle()
  if &foldcolumn
    setlocal foldcolumn=0
  else
    setlocal foldcolumn=2
  endif
endfunction

" TOGGLE THE MOUSE BETWEEN VIM AND TERMINAL MODE
function! ToggleMouse()
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

" FUNCTION TO TOGGLE A WIDE COLORCOLUMN WITH \CC
function! ToggleColorColumnWide()
  if &colorcolumn != ""
    setlocal colorcolumn&
  else
    let &colorcolumn=join(range(81,272),",")
    setlocal nowrap
  endif
endfunction

" FUNCTION TO TOGGLE CONCEAL LEVEL
function! ToggleConceal()
  if &conceallevel == 2
    setlocal conceallevel=0
  else
    setlocal conceallevel=2
  endif
endfunction

function! SetCursorColumn()
  let &colorcolumn=join(range(81,100),",") .
        \ ',' . join(range(102,120),",") .
        \ ',' . join(range(122,272),",")
endfunction
