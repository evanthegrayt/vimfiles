command! Sloc call evanthegrayt#sloc#CountSloc()
command! -bang Ri call ri#OpenSearchPrompt(<bang>0)
command! -complete=custom,evanthegrayt#standup#Completion -nargs=? -bang Standup
      \ call evanthegrayt#standup#OpenFile(<bang>0, <f-args>)
command! -nargs=1 -complete=custom,evanthegrayt#cdc#Completion Cdc
      \ call evanthegrayt#cdc#ChangeDirectory(<f-args>)
command! -count -bang Modeline call evanthegrayt#modeline#Add(<bang>0, <count>)
command! -bang -nargs=? Jira call evanthegrayt#jira#OpenIssue(<bang>0, <f-args>)
command! -range=% -bang HighlightRepeats <line1>,<line2>
      \ call evanthegrayt#highlight#Repeats(<bang>0)
command! OpenInGui call evanthegrayt#bffers#OpenInGui()
command! -range=% -bang RemoveConsecutiveSpaces call
      \ evanthegrayt#trim#ConsecutiveSpaces(<line1>, <line2>, <bang>1)
command! -nargs=1 -complete=custom,evanthegrayt#snippets#SnipComplete Snip
      \ call evanthegrayt#snippets#Snip(<f-args>)
