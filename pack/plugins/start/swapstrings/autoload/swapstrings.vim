" swapstrings.vim
"   Author: Charles E. Campbell, Jr.
"   Date:	Jan 21, 2009
"   Version: 1h	ASTRO-ONLY
"
"  Usage: {{{1
"    :[range]SwapStrings[!] string1 string2
"
"    default range: % (aka 1,$  or entire file)
"    !            : not present, strings protected with \<...\>
"                 : present, all such strings are swapped

" ---------------------------------------------------------------------
"  Load Once: {{{1
if &cp || exists("loaded_swapstrings")
 finish
endif
let g:loaded_swapstrings = "v1h"
if v:version < 700
 echohl WarningMsg
 echo "***warning*** this version of swapstrings needs vim 7.0"
 echohl Normal
 finish
endif
let s:keepcpo= &cpo
set cpo&vim

" ---------------------------------------------------------------------
"  SwapStrings : this command swaps two strings in the entire file {{{1
fun! swapstrings#SwapStrings(literal,s1,s2) range
"  call Dfunc("SwapStrings(literal=".a:literal." s1<".a:s1."> s2<".a:s2.">) lines[".a:firstline.",".a:lastline."]")
  if strlen(a:s1) >= strlen(a:s2)
   let s1 = a:s1
   let s2 = a:s2
  else
   let s2 = a:s1
   let s1 = a:s2
  endif

  let s1l = escape(s1,'\&/~')
  let s2l = escape(s2,'\&/~')

  if a:literal || a:s1 =~ '\A' || a:s2 =~ '\A'
   exe a:firstline.",".a:lastline.'s/\('.s1l.'\|'.s2l.'\)/\=((submatch(1) == '."'".s1."')? '".s2."' : '".s1."')/ge"
  else
   exe a:firstline.",".a:lastline.'s/\<\('.s1l.'\|'.s2l.'\)\>/\=((submatch(1) == '."'".s1."')? '".s2."' : '".s1."')/ge"
  endif

"  call Dret("SwapStrings")
endfun

let &cpo= s:keepcpo
unlet s:keepcpo
" ---------------------------------------------------------------------
"  Modelines: {{{1
"  vim: ts=4 fdm=marker
