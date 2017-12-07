" swapstringsPlugin.vim
"  Author: Charles E. Campbell, Jr.
"  Date:   Jul 18, 2006
"  Usage: {{{1
"    :[range]SwapStrings[!] string1 string2
"
"    default range: % (aka 1,$  or entire file)
"    !            : not present, strings protected with \<...\>
"                 : present, all such strings are swapped
"
" (Prov 2:6, WEB) For Yahweh gives wisdom. Out of his mouth comes
"                 knowledge and understanding.
" ---------------------------------------------------------------------
"  Load Once: {{{1
if &cp || exists("g:loaded_swapstringsPlugin")
 finish
endif
let g:loaded_swapstringsPlugin = "v1h"
let s:keepcpo                  = &cpo
set cpo&vim

" ---------------------------------------------------------------------
"  Public Interface: {{{1
com! -bang -range=% -nargs=+ SwapStrings silent <line1>,<line2>call swapstrings#SwapStrings(<bang>0,<f-args>)

" ---------------------------------------------------------------------
"  Restoration And Modelines: {{{1
"  vim: ts=4 fdm=marker
let &cpo= s:keepcpo
unlet s:keepcpo
