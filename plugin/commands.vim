command! Sloc echo len(filter(getline(1, '$'), 'v:val =~# "\\S"'))
command! -bang Ri call ri#OpenSearchPrompt(<bang>0)
