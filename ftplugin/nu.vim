setlocal tabstop=2 shiftwidth=2 softtabstop=2

function! OpenNushellDoc()
    let cmd = expand('<cword>')  " Get the word under the cursor
    let url = "https://www.nushell.sh/commands/docs/" . cmd . ".html"

    " Open in the browser (adjust for your OS)
    if has("mac")
        execute "silent !open " . shellescape(url) . " &" | redraw!
    elseif has("unix")
        execute "silent !xdg-open " . shellescape(url) . " &"
    elseif has("win32") || has("win64")
        execute "silent !start " . shellescape(url)
    endif
endfunction

" Map Shift+K to open the Nushell documentation
nnoremap <silent> <S-K> :call OpenNushellDoc()<CR>
