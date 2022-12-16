function! evanthegrayt#git#Branch() abort
  if exists('*FugitiveHead')
    return FugitiveHead()
  elseif !executable('git')
    call evanthegrayt#Error("Executable 'git' not found")
    return
  endif
  return system('git rev-parse --abbrev-ref HEAD')
endfunction
