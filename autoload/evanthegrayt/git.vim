function! evanthegrayt#git#Branch() abort
  if exists('*FugitiveHead')
    return FugitiveHead()
  endif
  if !executable('git')
    call evanthegrayt#Error("Executable 'git' not found")
    return
  endif
  return system('git rev-parse --abbrev-ref HEAD')
endfunction
