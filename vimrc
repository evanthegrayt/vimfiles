" FILE:         vimrc
" AUTHOR:       Evan Gray
" DESCRIPTION:  My general vim settings

" vi: set et ft=vim foldenable foldmethod=marker ts=2 sw=2 sts=2:

" NOTE: Type `zo` on a fold to open it, or `zn` to open all folds

" VERSION_8: Notes for myself {{{1
" To get vim8 working, delete the following link (on mac):
" /usr/local/share/vim -> /usr/share/vim/
" And re-link it to here:
" /usr/local/share/vim -> /usr/local/Cellar/vim/8.0.0002/share/vim/vim80
"}}}

" FILETYPE AND SYNTAX:      " Enable plugins, filetype detection, etc. {{{1
filetype on                 " Enable filetype detection
filetype plugin on          " Enable filetype dection for plugins
filetype indent on          " Enable indention by filetype
syntax   enable             " Turn on syntax highlighting
"}}}

" RUNTIME PATH: Make sure plugins are in &rtp {{{1
if has('nvim')
  set rtp+=~/.config/bundle/pathogen/
  call pathogen#infect()
elseif v:version < 800 && isdirectory($HOME . '/.vim/pack')
  set rtp+=~/.vim/pack/plugins/opt/pathogen/
  call pathogen#infect()
endif
runtime macros/matchit.vim
"}}}

" GLOBAL OPTIONS: Settings regardless of filetype or buffer {{{1
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
set title titlestring=      " Display vim info in terminal title bar
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
set lazyredraw              " don't update the display while executing macros
set backupdir=~/.vim/backup        " Set directory where backups will be stored
set viminfo+=n~/.vim/cache/viminfo " Keep viminfo in .vim dir
set directory=~/.vim/tmp           " keep .swp files in [dir], not the cwd.
"}}}

" MAPPINGS: Custom key mappings {{{
" Textmate Line Movement: Remap Ctrl + j/k move line or selection up/down
nnoremap <silent> <C-j> :m .+1<CR>==
nnoremap <silent> <C-k> :m .-2<CR>==
inoremap <silent> <C-j> <Esc>:m .+1<CR>==gi
inoremap <silent> <C-k> <Esc>:m .-2<CR>==gi
vnoremap <silent> <C-j> :m '>+1<CR>gv=gv
vnoremap <silent> <C-k> :m '<-2<CR>gv=gv
" Toggles: Toggle common vim settings local to buffer
nnoremap <silent> <Leader>h :setlocal hlsearch!<CR>
nnoremap <silent> <Leader>w :setlocal wrap!<CR>
nnoremap <silent> <Leader>i :setlocal autoindent!<CR>
nnoremap <silent> <Leader>l :setlocal list!<CR>
nnoremap <silent> <Leader>sc :setlocal spell! spelllang=en_us<CR>
" Indenting: `\fi` to fix the whole file's indenting
nnoremap <silent> <Leader>fi mzgg=G'z
" Saving: hit `\r` to save the file using sudo
nnoremap <Leader>r :w !sudo tee % <CR>
" Trailing Spaces: hit `\TS` to remove all trailing whitespace
nnoremap <silent> <Leader>TS :%s/\s\+$//<CR>
" Yanking: Make Y behave like D and C
nnoremap Y y$
" Yank File Path: Copy the expanded file-path of current file to clipboard
nnoremap <silent> <Leader>yfp :let @+ = expand("%:p") <CR>
" Redraw: <ctrl-l> to redraw
nnoremap <C-L> :redraw! <CR>
" Function Toggles: Mappings for functions in pack/settings/start/functions
if v:version > 701
  nnoremap <silent> <Leader>tc :call ToggleConceal()<CR>
  nnoremap <silent> <Leader>TC :call ToggleColorColumnWide()<CR>
  nnoremap <silent> <Leader>n  :call NumberToggle()<CR>
endif
nnoremap <silent> <Leader>mt :call ToggleMouse() <CR>
nnoremap <silent> <leader>tf :call FoldColumnToggle()<CR>
nnoremap <leader>co [I:let nr = input("Match: ")<Bar>exe "normal ".nr."[\t"<CR>
"}}}

" PLUGIN SETTINGS {{{1
" Disable Plugins Based On Version: Some plugins echo output. I don't want that.
if v:version <= 701
  let g:loaded_syntastic_plugin  = 1
  let g:loaded_indexed_search    = 1
  let loaded_nerd_tree           = 1
endif
if v:version < 703
  let g:loaded_tagbar            = 1
  let g:CSApprox_loaded          = 1
endif
if v:version < 704
  let g:airline#extensions#tagbar#enabled = 0
  let g:bufexplorer_version               = 1
endif
if v:version < 800 && isdirectory($HOME . "/.vim/pack/")
  let g:update_plugins_directory = $HOME . "/.vim/pack/*/{start,opt}"
endif
if !executable('git')
  let g:loaded_gitgutter = 1
  let g:loaded_nerdtree_git_status = 1
  let g:loaded_fugitive = 1
endif

" SUPERTAB: tab auto-completion when in insert-mode
let g:SuperTabDefaultCompletionType = 'context'
autocmd FileType *
      \ if &omnifunc != '' |
      \   call SuperTabChain(&omnifunc, "<c-p>") |
      \ endif

" RUBOCOP: debug ruby
let g:ruby_debugger_progname = 'mvim'

" UPDATE PLUGINS: update plugins from vim
let g:update_plugins_exclude = ['update-plugins']

" AIRLINE: advanced status line
if !exists('g:airline_symbols') | let g:airline_symbols = {} | endif
let g:airline_symbols.readonly              = '±'
let g:airline_symbols.linenr                = '¶'
let g:airline_symbols.paste                 = 'Þ'
let g:airline_symbols.whitespace            = '!'
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#syntastic#enabled  = 1
let g:airline#extensions#branch#enabled     = 1
let g:airline_detect_paste                  = 1
let g:airline_theme                         = "bubblegum"
let g:airline#extensions#whitespace#enabled = 1

" INDENT LINE: draw lines every intention
let g:indentLine_color_term = 239
let g:indentLine_enabled    = 1
let g:indentLine_char       = '┊'
nnoremap <silent> <Leader>it :IndentLinesToggle<CR>

" BUFFERLINE: show open buffers in airline
let g:bufferline_show_bufnr       = 0
let g:bufferline_echo             = 0
let g:bufferline_active_highlight = 'StatusLine'

" GITGUTTER: show diff in gutter
nnoremap <silent> <Leader>gg :GitGutterToggle<CR>

" TAGBAR: show classes/methods/functions in side window
nnoremap <silent> <Leader>TT :Tagbar<CR>
let g:tagbar_type_ruby = {
  \ 'kinds' : [
    \ 'T:todos',
    \ 'n:notes',
    \ 'R:required files',
    \ 'm:modules',
    \ 'c:classes',
    \ 'f:methods',
    \ 'P:private methods',
    \ 'p:protected methods',
    \ 'S:singleton methods',
    \ 'r:rules',
    \ 'o:buttons',
    \ 'Q:describes',
    \ 'Y:contexts',
    \ 'Z:examples',
    \ 'y:factories',
    \ 'z:traits',
    \ 's:test',
    \ 't:tasks'
  \ ]
\ }
let g:tagbar_type_sh = {
  \ 'kinds' : [
    \ 'T:todos',
    \ 'n:notes',
    \ 'S:sourced files',
    \ 'f:functions',
    \ 'a:aliases:0:0',
    \ 's:script files:0:0',
  \ ],
\ }

" RSPEC: Easily run RSpec tests from vim
let g:rspec_command = "Dispatch rspec {spec}"
map <Leader>rsf :call RunCurrentSpecFile()<CR>
map <Leader>rsn :call RunNearestSpec()<CR>
map <Leader>rsl :call RunLastSpec()<CR>
map <Leader>rsa :call RunAllSpecs()<CR>

" NERDTREE: a better file browser for vim
nnoremap <silent> <Leader>nt :NERDTreeToggle<CR>
nnoremap <silent> <Leader>nf :NERDTreeFind<CR>
let g:NERDTreeBookmarksFile = expand($HOME) . ".vim/cache/NERDTreeBookmarks"
let NERDTreeQuitOnOpen = 1

" GUNDO: a visualization of vim's unto tree
nnoremap <silent> <Leader>gt :GundoToggle<CR>
let g:gundo_prefer_python3  = 1
let g:gundo_close_on_revert = 1

" SYNTASTIC: checks the syntax of files and reports errors
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs  = 1

" DRAGVISUALS: move visual blocks around when in visual mode
vmap <expr> <S-h> DVB_Drag('left')
vmap <expr> <S-l> DVB_Drag('right')
vmap <expr> <S-j> DVB_Drag('down')
vmap <expr> <S-k> DVB_Drag('up')

" CTRLP: project file search
let g:ctrlp_working_path_mode = 'ra'

" ROOTER: set root directory at begiining of project
let g:rooter_patterns = ['.git', '.git/', 'Rakefile', 'Makefile',
      \                  '.hg/', '.bzr/', '.svn/']
let g:rooter_silent_chdir = 1

" SPLITJOIN: Split/Join lines of code syntastically
let g:splitjoin_align = 1

" ACK: better searching (requires TheSilverSearcher for `ag`)
if executable('ag')
  nnoremap <Leader>a :Ack!<Space>
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif

" EASTEREGG: my colorscheme
let g:easteregg_use_italics = 1 " Use italics
colorscheme easteregg           " Set my colorscheme

" MARKDOWN: markdown syntax plugin
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_folding_disabled     = 1

" PREVIM: live preview markdown, etc.
let g:previm_open_cmd = 'open -a Firefox'

"}}}

" LOCAL: source local vimrc if it exists {{{
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
"}}}

" NOTE: FUNCTIONS, GUI SETTINGS, AND AUTOCOMMANDS UNDER pack/settings/start

