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
endfunc
nnoremap <silent> <Leader>n :call NumberToggle()<cr>

" FUNCTION TO TOGGLE FOLDCOLUMN
function! FoldColumnToggle()
  if &foldcolumn
    setlocal foldcolumn=0
  else
    setlocal foldcolumn=2
  endif
endfunction
nnoremap <silent> <leader>tf :call FoldColumnToggle()<cr>

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
nnoremap <silent> <Leader>mt :call ToggleMouse() <CR>

" FUNCTION TO TOGGLE A WIDE COLORCOLUMN WITH \CC
function! ToggleColorColumnWide()
  if &colorcolumn != ""
    setlocal colorcolumn&
  else
    let &colorcolumn=join(range(81,272),",")
    setlocal nowrap
  endif
endfunction
nnoremap <silent> <Leader>TC :call ToggleColorColumnWide()<CR>

" FUNCTION TO TOGGLE CONCEAL LEVEL
function! ToggleConceal()
  if &conceallevel == 2
    setlocal conceallevel=0
  else
    setlocal conceallevel=2
  endif
endfunction
nnoremap <silent> <Leader>tc :call ToggleConceal()<CR>

