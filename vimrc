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
set directory=~/.vim/tmp    " keep .swp files in [dir], not the cwd.
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

" Only use plugins if version is > 7.1
if !(v:version >= 701 && !&diff)
  echo "Vim version less than 7.01; disabling plugins."
  finish
elseif v:version <= 703
  let g:bufexplorer_version = 1
  let g:loaded_tagbar = 1
  let g:update_plugins_directory = '~/.vim/pack/*/start'
endif

" DEBUG RUBY: debug ruby
let g:ruby_debugger_progname = 'mvim'

" UPDATE PLUGINS: update plugins from vim
let g:update_plugins_directory = '~/.vim/pack/*/start/'
let g:update_plugins_exclude = ['update-plugins']
let g:update_plugins_print_results = 1

" AIRLINE: advanced status line
if !exists('g:airline_symbols') | let g:airline_symbols = {} | endif
let g:airline_symbols.readonly              = '±'
let g:airline_symbols.linenr                = '¶'
let g:airline_symbols.paste                 = 'Þ'
let g:airline_symbols.whitespace            = '!'
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#syntastic#enabled  = 1
let g:airline#extensions#branch#enabled     = 1
let g:airline_detect_paste                  = 1
let g:airline_theme="bubblegum"
let g:airline#extensions#whitespace#enabled = 1

" INDENT LINE: draw lines every intention
let g:indentLine_color_term = 239
let g:indentLine_enabled = 1
let g:indentLine_char = '┊'

" BUFFERLINE: show open buffers in airline
let g:bufferline_show_bufnr = 0
let g:bufferline_echo = 0
let g:bufferline_active_highlight = 'StatusLine'

" GITGUTTER: show diff in gutter
nnoremap <silent> <Leader>gg :GitGutterToggle<CR>

" INDENTLINES: show think lines at each indention level
nnoremap <silent> <Leader>it :IndentLinesToggle<CR>

" TAGBAR: show classes/methods/functions in side window
nnoremap <silent> <Leader>TT :Tagbar<CR>

" NERDTREE: a better file browser for vim
nnoremap <silent> <Leader>nt :NERDTreeToggle<CR>

" GUNDO: a visualization of vim's unto tree
nnoremap <silent> <Leader>gt :GundoToggle<CR>

" SYNTASTIC: checks the syntax of files and reports errors
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs  = 1

" DRAGVISUALS: move visual blocks around when in visual mode
vnoremap <expr> <S-h> DVB_Drag('left')
vnoremap <expr> <S-l> DVB_Drag('right')
vnoremap <expr> <S-j> DVB_Drag('down')
vnoremap <expr> <S-k> DVB_Drag('up')

" CTRLP: project file search
let g:ctrlp_working_path_mode = 'ra'

" ROOTER: set root directory at begiining of project
let g:rooter_patterns = ['Rakefile', '.git/']
let g:rooter_silent_chdir = 1

" BUFEXPLORER: Easily switch between open buffers
let g:bufExplorerSplitHorzSize = 10

" SPLITJOIN: Split/Join lines of code syntastically
let g:splitjoin_align = 1

" ACK: better searching (requires TheSilverSearcher for `ag`)
if executable('ag')
  nnoremap <Leader>a :Ack!<Space>
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif

" EASTEREGG: my colorscheme
let g:easteregg_use_italics = 1 " Use italics
colorscheme easteregg       " Set my colorscheme

" FUNCTIONS, AND AUTOCOMMANDS UNDER pack/settings/start

