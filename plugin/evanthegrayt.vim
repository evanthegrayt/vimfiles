command! Sloc echo len(filter(getline(1, '$'), 'v:val =~# "\\S"'))
command! -bang Ri call ri#OpenSearchPrompt(<bang>0)
command! SynStack
      \ if exists("*synstack") |
      \   echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")') |
      \ endif
command! -complete=custom,evanthegrayt#standup#Completion -nargs=? -bang Standup
      \ call evanthegrayt#standup#OpenFile(<bang>0, <f-args>)
command! -nargs=1 -complete=custom,evanthegrayt#cdc#Completion Cdc
      \ call evanthegrayt#cdc#ChangeDirectory(<f-args>)
command! -count -bang Modeline call evanthegrayt#modeline#Add(<bang>0, <count>)

command! -nargs=? -complete=custom,evanthegrayt#sessions#Completion SessionLoad
      \ call evanthegrayt#sessions#Load(<f-args>)
command! -bang -nargs=? -complete=custom,evanthegrayt#sessions#Completion Mksession
      \ call evanthegrayt#sessions#Mksession(<bang>0, <f-args>)
command! -nargs=? -complete=custom,evanthegrayt#sessions#Completion SessionStart
      \ call evanthegrayt#sessions#Start(<f-args>)
command! -nargs=? -complete=custom,evanthegrayt#sessions#Completion SessionDelete
      \ call evanthegrayt#sessions#Delete(<f-args>)
