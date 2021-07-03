function! evanthegrayt#sessions#Start(...) abort
  if !exists(':Obsession')
    echohl ErrorMsg | echomsg 'vim-obsession not installed.' | echohl None
    return
  endif
  let l:dir = s:Directory()
  let l:file = a:0 ? a:1 . '.vim' : s:File()
  execute 'Obsession ' . l:dir . l:file
endfunction

function! evanthegrayt#sessions#Load(...) abort
  let l:dir = s:Directory()
  let l:file = a:0 ? a:1 . '.vim' : s:File()
  execute 'source ' . l:dir . l:file
endfunction

function! evanthegrayt#sessions#Mksession(bang, ...) abort
  let l:command = 'mksession'
  if a:bang || get(g:, 'session_mksession_bang')
    let l:command .= '!'
  endif
  let l:dir = s:Directory()
  let l:file = a:0 ? a:1 . '.vim' : s:File()
  try
    execute l:command . ' ' . l:dir . l:file
  catch /^Vim\%((\a\+)\)\=:E189:/
    echohl ErrorMsg
    echomsg l:file . " exists. Add '!' to overwrite."
    echohl None
  endtry
endfunction

function! evanthegrayt#sessions#Delete(...) abort
  let l:session = a:0 ? a:1 : s:Branch()
  if l:session == s:Branch() && exists(':Obsession')
    Obsession!
    return
  endif
  let l:file = s:Directory() . l:session . '.vim'
  if filereadable(l:file)
    echo 'Deleting session ' . l:session
    call delete(l:file)
  else
    echohl ErrorMsg
    echomsg 'Session ' . l:session . ' does not exist.'
    echohl None
  endif
endfunction

function! evanthegrayt#sessions#Completion(...) abort
  let l:dir = s:Directory()
  if !isdirectory(l:dir)
    return ''
  endif
  let l:list = map(
        \   glob(l:dir . '*.vim', 0, 1), "substitute(v:val, '.vim$', '', '')"
        \ )
  return join(map(l:list, "substitute(v:val, l:dir, '', '')"), "\n")
endfunction

function! s:File() abort
  let l:current_dir = fnamemodify(getcwd(), ':t')
  let l:branch = s:Branch()

  if empty(l:branch)
    return l:current_dir . '.vim'
  else
    return l:branch . '.vim'
  endif
endfunction

function! s:Directory() abort
  let l:dir = get(g:, 'session_directory', $HOME . '/.cache/vim_sessions')
  let l:branch = s:Branch()
  let l:current_dir = fnamemodify(getcwd(), ':t')
  if !empty(l:branch)
    let l:dir .= '/' . l:current_dir
  endif
  if !isdirectory(l:dir)
    call mkdir(l:dir, 'p')
  endif
  return l:dir . '/'
endfunction

function! s:Branch() abort
  if exists('*FugitiveHead')
    return FugitiveHead()
  else
    return trim(system('git rev-parse --abbrev-ref HEAD 2>/dev/null'))
  endif
endfunction
