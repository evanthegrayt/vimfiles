function! evanthegrayt#rails#DescribeTable() abort
  let l:full_file = fnamemodify(expand("%"), ':p')
  let l:file_name = fnamemodify(l:full_file, ':t:r')
  if match(l:full_file, '\/app\/models\/') > -1
    execute 'DB \d' rails#pluralize(l:file_name)
  elseif match(l:full_file, '\/app\/controllers\/') > -1
    execute 'DB \d' substitute(l:file_name, '_controller', '', '')
  else
    call feedkeys(':DB \d ')
  endif
endfunction
