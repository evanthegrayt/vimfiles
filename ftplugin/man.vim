" ---------- tabulator / shiftwidth --------
"  Set tabulator and shift width to 2 (ruby)
"
" No compatibility – necessary for mappings to work.
"set nocompatible

" Status line
"set laststatus=0
"set cmdheight=1
"set nomodifiable " Only in version 6.0
"set readonly

" My xterms have a navy-blue background, so I need this line too.
"set background=dark

" Turn syntax on
"syntax enable

" No menu bar and tool bar
setlocal guioptions=aiMr

" Key bindings.
nnoremap <buffer> b <C-B><C-G>
nnoremap <buffer> f <C-F><C-G>
nnoremap <buffer> j <C-E><C-G>
nnoremap <buffer> k <C-Y><C-G>
nnoremap <buffer> q :q!<CR>
nnoremap <buffer> <Up> <C-Y>
nnoremap <buffer> <Down> <C-E>
nnoremap <buffer> ^V <C-F><C-G>
" To type the previous line, type *two* C-V's followed by two spaces. This
" is how you map the spacebar.

