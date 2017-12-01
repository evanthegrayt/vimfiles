
" Fixes runtimepath issues for html files
" Language:	HTML
" Author:	Rob O'Dwyer
" Last Change:	April 2, 2011
" Filenames:	*.html, *.htm

" Quit when a syntax file was already loaded
if exists("b:current_syntax")
    echo "Warning: html syntax has been overridden!"
    finish
endif

" Deactivate extra stuff on runtimepath
let s:oldrtp=&runtimepath
set runtimepath=$VIMRUNTIME

" Source default html syntax file
runtime syntax/html.vim

" Restore runtimepath
let &runtimepath=s:oldrtp

" Prevent other syntax files from loading
let b:current_syntax='html'
