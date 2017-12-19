
if !has('gui_running') " No need for .gvimrc
  finish
endif

set guioptions-=L
set guioptions-=l
set guioptions-=R
set guioptions-=r
set mouse=a
set vb t_vb=

if has("gui_gtk2")
  set guifont=Hack\ 10, Monospace\ 10
elseif has("gui_macvim")
  set guifont=Hack:h11,Monaco:h11
elseif has("gui_win32") || has("gui_win64")
  set guifont=Consolas:h11:cANSI
endif

