"=============================================================================="
" FILE:         vimrc                                                          "
" AUTHOR:       Evan Gray (evanthegrayt)                                       "
" DESCRIPTION:  My general vim settings.                                       "
"                                                                              "
" For custom commands and functions that aren't full plugins, check            "
" plugin/evanthegrayt.vim and autoload/evanthegrayt.vim.                       " 
"                                                                              "
" NOTE: Type `zo` on a fold to open it, `zn` to open all folds. `zc` to close. "
"=============================================================================="

" FILETYPE AND SYNTAX: " Enable plugins, filetype detection, etc. {{{1
filetype on            " Enable filetype detection
filetype plugin on     " Enable filetype dection for plugins
filetype indent on     " Enable indention by filetype
syntax   enable        " Turn on syntax highlighting
"}}}

" RUNTIME PATH: Make sure plugins are in &rtp {{{1
if v:version < 800
  set rtp+=~/.vim/pack/tpope/opt/pathogen/
  call pathogen#infect()
endif
runtime macros/matchit.vim
"}}}

" GLOBAL OPTIONS: Settings regardless of filetype or buffer {{{1
set diffopt+=iwhite
set viewoptions-=options
set colorcolumn=81,101,121
set nrformats+=alpha
set laststatus=2
set encoding=utf-8
set showcmd
set shortmess=at
set clipboard=unnamed
set list
exec "set listchars=tab:¦\uB7,trail:\uB7,nbsp:~,eol:¬,extends:→,precedes:←"
set number
set noerrorbells
set belloff=all
set sidescroll=1
set sidescrolloff=3
set scrolloff=3
set wildmenu
set expandtab
set autoindent
set smartindent
set title
set history=1000
set backup
set wrapscan
set nowrap
set linebreak
set smartcase
set infercase
set ignorecase
set incsearch
set hlsearch
set backspace=2
set tabstop=4
set shiftwidth=4
set hidden
set confirm
set lazyredraw
set backupdir=~/.vim/backup
set viminfo+=n~/.vim/cache/viminfo
set directory=~/.vim/tmp
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
nnoremap <silent> <Leader>sc :setlocal spell! spelllang=en_us<CR>
nnoremap <silent> <Leader>nu :call evanthegrayt#relative_number#Toggle()<CR>

" Indenting: `\fi` to fix the whole file's indenting
nnoremap <silent> <Leader>fi gg=G``

" Trailing Spaces: hit `\TS` to remove all trailing whitespace
nnoremap <silent> <Leader>TS :%s/\s\+$//<CR>

" Yanking: Make Y behave like D and C
nnoremap Y y$

" Function Toggles: Mappings for functions in autoload/evanthegrayt.vim
if v:version > 701
  nnoremap <silent> <Leader>tc :call evanthegrayt#ToggleConceal()<CR>
  nnoremap <silent> <Leader>TC :call evanthegrayt#ToggleColorColumn()<CR>
endif
nnoremap <silent> <Leader>mt :call evanthegrayt#ToggleMouse() <CR>
nnoremap <silent> <leader>tf :call evanthegrayt#ToggleFoldColumn()<CR>
nnoremap <leader>co [I:let nr = input("Match: ")<Bar>exe "normal ".nr."[\t"<CR>
nnoremap <silent> <Leader>ml :call evanthegrayt#AppendModeline()<CR>
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
nnoremap gx yiW:!open <cWORD><CR> <C-r>" & <CR><CR>

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
      \   project:  'doc/notes',
      \ }
let g:noteworthy_default_library = 'work'
let g:noteworthy_file_ext        = 'md'

let g:cdc_dirs = [
      \   $HOME . '/.oh-my-zsh/custom/plugins',
      \   $HOME . '/workflow',
      \   $HOME . '/workflow/vagrant-ofa/src',
      \   $HOME . '/.vim/pack/evanthegrayt/start',
      \   $HOME . '/.vim/pack/public-strategies/start'
      \ ]

" RI: Browse ruby's RI documentation through vim.
let g:ri_no_mappings = 1

let g:evanthegrayt_ps_projects = [
      \   $HOME . '/workflow/srae-pas-dashboard'
      \ ]
"}}}

" GUI: GUI-specific settings {{{
if has('gui_running')
  set guioptions-=L
  set guioptions-=l
  set guioptions-=R
  set guioptions-=r
  set vb t_vb=
  set mouse=

  if has('gui_gtk2')
    set guifont=Monospace\ 9
  elseif has("gui_macvim")
    set guifont=Hack:h11,Monaco:h11
  elseif has("gui_win32") || has("gui_win64")
    set guifont=Consolas:h11:cANSI
  endif
endif
"}}}

" Autocommands: Non-filetype-related autocommands {{{
if has('autocmd')
  augroup vimrc
    autocmd!
    " Set backup extension. Saves one backup per file per hour, per day.
    autocmd BufWritePre * let &backupext = '.' . strftime("%Y%m%d%H")
    " Turn off auto-comments on return.
    autocmd FileType * setlocal fo-=c fo-=r fo-=o
    autocmd BufWritePost *
          \ if expand('%') != '' && &buftype !~ 'nofile' | mkview | endif
    autocmd BufRead *
          \ if expand('%') != '' && &buftype !~ 'nofile' | silent loadview | endif
    " Global syntax hightligting for NOTE, etc. in comments.
    autocmd Syntax * syn match MyTodo /\v<(HACK|FIXME|NOTE|TODO)/
          \ containedin=.*Comment,vimCommentTitle
    hi def link MyTodo Todo
  augroup END
endif
"}}}

" LOCAL: source ~/.vimrc.local if it exists {{{
if filereadable($HOME . "/.vimrc.local")
  source $HOME/.vimrc.local
endif
"}}}

" vi: set et ft=vim foldenable foldmethod=marker ts=2 sw=2 sts=2:
