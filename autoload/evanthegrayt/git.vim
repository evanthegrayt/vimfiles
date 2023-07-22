function! evanthegrayt#git#Branch() abort
  if exists('*FugitiveHead')
    return FugitiveHead()
  elseif !executable('git')
    return evanthegrayt#Error("Executable 'git' not found")
  endif
  return system('git rev-parse --abbrev-ref HEAD')
endfunction
