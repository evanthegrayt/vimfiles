command! Sloc :echo len(filter(getline(1, '$'), 'v:val =~# "\\S"'))
