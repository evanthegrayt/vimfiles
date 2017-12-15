" File: .vimrc
" Author: erg
" Description: My super awesome vim settings
" Last Modified: Tue Mar 10 14:27:58 2015
" vi: set ft=vim :

" To get vim8 working, delete the following link (on mac):
" /usr/local/share/vim -> /usr/share/vim/
" And re-link it to here:
" /usr/local/share/vim -> /usr/local/Cellar/vim/8.0.0002/share/vim/vim80
filetype on                 " Reenable filetype detection
filetype plugin on          " Enable filetype dection for plugins
filetype indent on          " Enable indention by filetype
syntax   enable             " Turn on syntax highlighting

if has('nvim')
  set rtp+=~/.config/bundle/pathogen/
  call pathogen#infect()
elseif v:version < 800 && isdirectory($HOME . '/.vim/pack')
  set rtp+=~/.vim/pack/plugins/opt/pathogen/
  call pathogen#infect()
endif

" GLOBAL OPTIONS ============ DESCRIPTIONS
set laststatus=2            " Always show the statusline; must be on for airline
set encoding=utf-8          " Necessary to show unicode glyphs
set showcmd                 " Display incomplete commands in statusline
set shortmess=at            " Shortens about every message to a minimum
set clipboard=unnamed       " Share clipboard with system
set list                    " Mark tabs, EOL, trailing whitespace, etc
exec "set listchars=tab:}-,trail:\uB7,nbsp:~,eol:¬,extends:→,precedes:←"
set number                  " Show line numbers (can toggle with \n)
set ruler                   " Show cursor position in status bar.
set noerrorbells            " Turn off visual and audible error notifications
set sidescroll=1            " Minimum cols to scroll horizontally with nowrap
set sidescrolloff=3         " When sidescrolling, n lines show beside the cursor
set scrolloff=3             " When vertscrolling, n lines show beside the cursor
set wildmenu                " Command line completion
set expandtab               " convert tabs to spaces
set autoindent              " Keep indention of prev line when creating new line
set smartindent             " Will auto-indent when needed
set title                   " Display vim info in terminal title bar
set history=1000            " Set the size of history
set backup                  " Turn on backups
set wrapscan                " Wrap search to top of document when bottom is hit
set nowrap                  " Do not wrap lines if they are wider than the term
set linebreak               " Wrap lines at a space instead of character limit
set smartcase               " Don't ignore case when the pattern has uppercase
set infercase               " During keyword completion, fix case of new word
set noshowmatch             " Do NOT jump to matching braces when inserted
set ignorecase              " Ignore case when searching
set incsearch               " Search as you type
set hlsearch                " Turn on higlight searching, toggle with \h
set backspace=2             " Allow backspacing past starting point
set tabstop=4               " Set tabs to 4 by default.
set shiftwidth=4            " Number of spaces used for (auto)indenting
set textwidth=0             " Auto-return after n columns
set cmdheight=1             " Please, no high command bar
set whichwrap+=<,>          " Arrow keys will wrap, don't like h+l to do this
set hidden                  " A buffer becomes hidden when abandoned
set confirm                 " If unsaved changes, ask to save
set noswapfile              " Don't use a swap file
set backupdir=~/.vim/backup " Set directory where backups will be stored
set lazyredraw              " don't update the display while executing macros
"set directory=~/.vim/tmp    " keep .swp files in [dir], not the cwd.
let ruby_minlines=5000      " Loand syntax highlighting for more lines

" KEY REMAPPINGS & TOGGLES
" Remappings to make Ctrl + j/k move line or selection up/down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
" TOGGLE COMMON VIM SETTINGS
nnoremap <silent> <Leader>h :set hlsearch!<CR>
nnoremap <silent> <Leader>w :set wrap!<CR>
nnoremap <silent> <Leader>i :set autoindent!<CR>
nnoremap <silent> <Leader>l :set list!<CR>
" HIT \fi TO FIX THE WHOLE FILE'S INDENTING
nnoremap <Leader>fi mzgg=G'z
" HIT \r TO SAVE THE FILE USING SUDO
nnoremap <Leader>r :w !sudo tee % <CR>
nnoremap <Leader>TS :%s/\s\+$//<CR>
" FIX WHOLE FILE - FIXES INDENTING, TRAILING SPACE, AND CONVERTS TABS TO SPACES
nnoremap <Leader>fwf :retab<CR> mzgg=G'z<CR> :%s/\s\+$//<CR>
" j and k not skip lines if line wrap is on
nnoremap <silent> k gk
vnoremap <silent> k gk
nnoremap <silent> j gj
vnoremap <silent> j gj
" Toggle Spell Check
nnoremap <Leader>sc :setlocal spell! spelllang=en_us<CR>
" Ctrl-L to redraw
nnoremap <C-L> :redraw! <CR>

" FUNCTIONS, AUTOCOMMANDS, AND PLUGIN SETTINGS UNDER pack/settings/start

