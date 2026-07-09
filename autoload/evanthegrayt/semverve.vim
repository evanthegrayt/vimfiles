function! evanthegrayt#semverve#Audit(report_ignored) abort
  let l:old_efm = &errorformat
  try
    let &errorformat = '%f:%l:%c:%m'
    let l:string = ""
    if a:report_ignored
      let l:string .= 'SEMVERVE_REPORT_IGNORED=true '
    endif
    let l:string .= 'bundle exec rake version:check 2>/dev/null'
    cexpr systemlist(l:string)
    if v:shell_error != 0
      copen
    else
      cclose
      echo 'Semverve checks passed.'
    endif
  finally
    let &errorformat = l:old_efm
  endtry
endfunction

