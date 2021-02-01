command! Sloc echo len(filter(getline(1, '$'), 'v:val =~# "\\S"'))
command! -bang Ri call ri#OpenSearchPrompt(<bang>0)
command! SynStack call evanthegrayt#SynStack()

if executable('standup')
  command! -complete=custom,evanthegrayt#StandupCompletion -nargs=? -bang Standup
        \ call evanthegrayt#OpenStandupFile(<bang>0, <f-args>)
endif

command! -nargs=1 -complete=custom,evanthegrayt#CdcCompletion Cdc
      \ call evanthegrayt#ChangeDirectory(<f-args>)
