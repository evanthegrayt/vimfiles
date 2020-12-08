" vi: set et ft=vim foldenable foldmethod=marker ts=2 sw=2 sts=2:
"=============================================================================="
" FILE:         vimrc                                                          "
" AUTHOR:       Evan Gray                                                      "
" DESCRIPTION:  My general vim settings                                        "
"                                                                              "
" To clean up this vimrc, some settings are kept in their own files:           "
" Autocommands: plugin/autocommands.vim                                        "
" Commands:     plugin/commands.vim                                            "
" GUI Settings: plugin/gui.vim                                                 "
" Functions:    autoload/evanthegrayt.vim                                      "
"                                                                              "
" NOTE: Type `zo` on a fold to open it, `zn` to open all folds. `zc` to close. "
"=============================================================================="

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
  set rtp+=~/.vim/pack/tpope/opt/pathogen/
  call pathogen#infect()
endif
runtime macros/matchit.vim
"}}}

" GLOBAL OPTIONS: Settings regardless of filetype or buffer {{{1
set colorcolumn=81,101,121
set nrformats+=alpha        " Allow <C-A> and <C-X> to work on letters
set laststatus=2            " Always show the statusline; must be on for airline
set encoding=utf-8          " Necessary to show unicode glyphs
set showcmd                 " Display incomplete commands in statusline
set shortmess=at            " Shortens about every message to a minimum
set clipboard=unnamed       " Share clipboard with system
set list                    " Mark tabs, EOL, trailing whitespace, etc
exec "set listchars=tab:¦\uB7,trail:\uB7,nbsp:~,eol:¬,extends:→,precedes:←"
set number                  " Show line numbers (can toggle with \n)
set noerrorbells            " Turn off visual and audible error notifications
set belloff=all             " Turn off visual and audible error notifications
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
set ignorecase              " Ignore case when searching
set incsearch               " Search as you type
set hlsearch                " Turn on higlight searching, toggle with \h
set backspace=2             " Allow backspacing past starting point
set tabstop=4               " Set tabs to 4 by default.
set shiftwidth=4            " Number of spaces used for (auto)indenting
set hidden                  " A buffer becomes hidden when abandoned
set confirm                 " If unsaved changes, ask to save
set lazyredraw              " don't update the display while executing macros
set exrc                    " Source .vimrc if it exists in current directory
set backupdir=~/.vim/backup        " Set directory where backups will be stored
set viminfo+=n~/.vim/cache/viminfo " Keep viminfo in .vim dir
set directory=~/.vim/tmp           " keep .swp files in [dir], not the cwd.
if executable('ag') | set grepprg=ag\ --nogroup\ --nocolor | endif
if exists('+spelloptions') | set spelloptions=camel | endif
"}}}

" MAPPINGS: Custom key mappings {{{

" Up/Downcase the current word while in insert mode.
inoremap <silent> <c-g>u <esc>guawea
inoremap <silent> <c-g>U <esc>gUawea

" Textmate Line Movement: Remap Ctrl + j/k move line or selection up/down
nnoremap <silent> <C-j> :m .+1<CR>==
nnoremap <silent> <C-k> :m .-2<CR>==
vnoremap <silent> <C-j> :m '>+1<CR>gv=gv
vnoremap <silent> <C-k> :m '<-2<CR>gv=gv

" Toggles: Toggle common vim settings local to buffer
nnoremap <silent> <Leader>l :setlocal list!<CR>
nnoremap <silent> <Leader>sc :setlocal spell! spelllang=en_us<CR>

" Indenting: `\fi` to fix the whole file's indenting
nnoremap <silent> <Leader>fi mzgg=G'z

" Trailing Spaces: hit `\TS` to remove all trailing whitespace
nnoremap <silent> <Leader>TS :%s/\s\+$//<CR>

" Yanking: Make Y behave like D and C
nnoremap Y y$

" Function Toggles: Mappings for functions in
" autoload/functions.vim
if v:version > 701
  nnoremap <silent> <Leader>tc :call evanthegrayt#ToggleConceal()<CR>
  nnoremap <silent> <Leader>TC :call evanthegrayt#ToggleColorColumn()<CR>
endif
nnoremap <silent> <Leader>mt :call evanthegrayt#ToggleMouse() <CR>
nnoremap <silent> <leader>tf :call evanthegrayt#FoldColumnToggle()<CR>
nnoremap <leader>co [I:let nr = input("Match: ")<Bar>exe "normal ".nr."[\t"<CR>
nnoremap <silent> <Leader>ml :call evanthegrayt#AppendModeline()<CR>
nnoremap <silent> <Leader>ss :call evanthegrayt#SynStack()<CR>
"}}}

" PLUGIN SETTINGS {{{1
" Disable Plugins Based On Version: Some plugins echo output. I don't want that.
if v:version <= 701
  let g:loaded_indexed_search = 1
endif
if v:version < 703
  let g:loaded_tagbar = 1
  let g:CSApprox_loaded = 1
endif
if v:version < 704
  let g:airline#extensions#tagbar#enabled = 0
endif
if v:version < 800 && isdirectory($HOME . "/.vim/pack/")
  let g:update_plugins_directory = $HOME . "/.vim/pack/*/{start,opt}"
endif
if !executable('git')
  let g:loaded_gitgutter = 1
  let g:loaded_fugitive = 1
endif

" NETRW: file browser
let g:netrw_home = $HOME . "/.vim/cache"
nnoremap <silent> <leader>nt :Ntree<CR>
" Workaround for broken 'gx'
nmap gx yiW:!open <cWORD><CR> <C-r>" & <CR><CR>

" EASYMOTION: Easily jump to markers
" let g:EasyMotion_force_csapprox = 1

" RAINBOW: Different color parens
let g:rainbow_active = 0
nnoremap <silent> <Leader>rt :RainbowToggle<CR>

" SUPERTAB: tab auto-completion when in insert-mode
let g:SuperTabDefaultCompletionType = 'context'
augroup vimrc_supertab
  autocmd!
  autocmd FileType *
        \ if &omnifunc != '' |
        \   call SuperTabChain(&omnifunc, "<c-p>") |
        \ endif
augroup END

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
let g:airline#extensions#ale#enabled        = 1
let g:airline#extensions#branch#enabled     = 1
let g:airline_detect_paste                  = 1
let g:airline_theme                         = 'easteregg'
let g:airline#extensions#whitespace#enabled = 1

" ALE: Asynchronous Linting Engine
let g:ale_set_highlights = 0
let g:ale_fixers = { 'ruby': 'rubocop' }
" let g:ale_completion_enabled = 1

" INDENT LINE: draw lines every indention level
let g:indentLine_color_term = 239
let g:indentLine_enabled    = 1
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
nnoremap <silent> <Leader>it :IndentLinesToggle<CR>

" GITGUTTER: show diff in gutter
nnoremap <silent> <Leader>ggt :GitGutterBufferToggle<CR>
nnoremap <silent> <Leader>ggu :GitGutterUndoHunk<CR>
let g:gitgutter_preview_win_floating = 1

" TAGBAR: show classes/methods/functions in side window
nnoremap <silent> <Leader>TT :Tagbar<CR>

" UNDOTREE: Visualize the undo tree
if has("persistent_undo")
  set undodir=$HOME."/.vim/cache"
  set undofile
endif

" CTRLP: project file search
let g:ctrlp_extensions = ['tag', 'buffertag']
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = 'node_modules\|DS_STORE\|git\|vendor\|public\|tmp'
nnoremap <silent> <Leader>be :CtrlPBuffer<CR>
nnoremap <silent> <Leader>bm :CtrlPMRUFiles<CR>
nnoremap <silent> <Leader>bt :CtrlPTag<CR>
nnoremap <silent> <Leader>bb :CtrlPBufTag<CR>
nnoremap <c-]> :CtrlPtjump<cr>
vnoremap <c-]> :CtrlPtjumpVisual<cr>

" ROOTER: set root directory at beginning of project
let g:rooter_silent_chdir = 1
let g:rooter_patterns = ['.git', '.git/', 'Rakefile', 'Makefile',
      \ '.hg/', '.bzr/', '.svn/']

" SPLITJOIN: Split/Join lines of code syntastically
let g:splitjoin_ruby_hanging_args = 0
let g:splitjoin_ruby_curly_braces = 0

" EASTEREGG: my colorscheme
let g:easteregg_use_italics = 1 " Use italics
colorscheme easteregg           " Set my colorscheme

" GUTENTAGS: Tags manager
let g:gutentags_enabled = 1
let g:gutentags_ctags_exclude = ['node_modules', 'vendor', 'public', '*.md',
      \ '*.css', '*.html', '*.svg', '*.json', '*.xml']

" NOTEWORTHY: Notes
let g:noteworthy_libraries = #{
      \   code:     $HOME . '/workflow/notes/code',
      \   work:     $HOME . '/workflow/notes/public_strategies',
      \   personal: $HOME . '/Documents/notes',
      \ }
let g:noteworthy_default_library = 'work'
let g:noteworthy_file_ext        = 'md'

" RI: Browse ruby's RI documentation through vim.
let g:ri_no_mappings = 1
"}}}

" LOCAL: source local vimrc if it exists {{{
if filereadable($HOME . "/.vimrc.local")
  source $HOME/.vimrc.local
endif
"}}}
