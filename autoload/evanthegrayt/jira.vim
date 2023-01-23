function! evanthegrayt#jira#OpenIssue(current_line, ...) abort
  if !exists('g:evanthegrayt_jira_board_url')
    return evanthegrayt#Error('You must set g:evanthegrayt_jira_board_url')
  endif

  let l:keywords = get(g:, 'evanthegrayt_jira_keywords', ['ISSUE', 'TODO'])
  let l:command = get(g:, 'evanthegrayt_jira_open_command', 'open')
  let l:regex = '\v(' . join(l:keywords, '|') . '):?\s*\[?\zs\w{2,}-\d+\ze\]?\c'
  let l:url = g:evanthegrayt_jira_board_url

  if a:current_line
    let l:issue_number = matchstr(getline('.'), l:regex)
    if empty(l:issue_number)
      return evanthegrayt#Error('No issue found on line.')
    endif
  else
    let l:issue_number = a:0 ? a:1 : matchstr(evanthegrayt#git#Branch(), '\v^\w{2,}-\d+')
  endif

  if !empty(l:issue_number)
    if l:url[(len(l:url - 1))] != '/'
      let l:url .= '/'
    endif
    let l:url .= 'browse/' . toupper(l:issue_number)
  endif

  call system(l:command . ' ' . l:url)
endfunction
