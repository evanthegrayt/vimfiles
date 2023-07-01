""
" Open a Jira issue either by passing it as an argument, by prefacing your git
" branch with the issue number, or by seaching the current line. :h :Jira
function! evanthegrayt#jira#OpenIssue(current_line, ...) abort
  if !exists('g:evanthegrayt_jira_board_url')
    return evanthegrayt#Error('You must set g:evanthegrayt_jira_board_url')
  endif

  let l:keywords = get(g:, 'evanthegrayt_jira_keywords', ['ISSUE', 'TODO'])
  let l:command = get(g:, 'evanthegrayt_jira_open_command', 'open')
  let l:line_regex = '\v(' . join(l:keywords, '|') . '):?\s*\[?\zs\w{2,}-\d+\ze\]?\c'
  let l:issue_regex =  '\v^\w{2,}-\d+'
  let l:url = g:evanthegrayt_jira_board_url

  if a:current_line
    let l:issue_number = matchstr(getline('.'), l:line_regex)
    if empty(l:issue_number)
      return evanthegrayt#Error('No issue found on line.')
    endif
  else
    if a:0
      let l:issue_number = matchstr(a:1, l:issue_regex)
      if empty(l:issue_number)
        return evanthegrayt#Error('Invalid issue number')
      endif
    else
      let l:issue_number = matchstr(evanthegrayt#git#Branch(), l:issue_regex)
    endif
  endif

  if l:url[-1:] != '/'
    let l:url .= '/'
  endif

  if empty(l:issue_number)
    let l:url .= 'jira/your-work'
  else
    let l:url .= 'browse/' . toupper(l:issue_number)
  endif

  call system(l:command . ' ' . l:url)
endfunction
