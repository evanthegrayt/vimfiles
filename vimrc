"=============================================================================="
" FILE:         vimrc                                                          "
" AUTHOR:       Evan Gray :: https://github.com/evanthegrayt                   "
" DESCRIPTION:  My general vim settings.                                       "
"                                                                              "
" For custom commands and functions that aren't full plugins, check here.      "
" plugin/evanthegrayt.vim and autoload/evanthegrayt.vim.                       "
"                                                                              "
" Read my help documentation for information about this repository.            "
" :help evanthegrayt                                                           "
"                                                                              "
" NOTE: Type `zo` on a fold to open it, `zn` to open all folds. `zN` to close. "
"=============================================================================="

" FILETYPE AND SYNTAX: {{{1
filetype on
filetype plugin on
filetype indent on
syntax   enable
"}}}

" RUNTIME PATH: Load the things. {{{1
if v:version < 800
  echoerr 'Versions less than 8.0 no longer supported. Please upgrade vim.'
else
  packadd matchit
endif
"}}}

" GLOBAL OPTIONS: Settings regardless of filetype or buffer {{{1
set showmatch
set formatoptions+=j
set diffopt+=iwhite
set viewoptions-=options
set colorcolumn=81,101,121
set nrformats+=alpha
set laststatus=2
set encoding=utf-8
set showcmd
set noshowmode
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

" Indenting: `\fi` to fix the whole file's indenting
nnoremap <silent> <Leader>fi gg=G``

" Trailing Spaces: hit `\st` to remove all trailing whitespace
nnoremap <silent> <Leader>st :%s/\s\+$//<CR><c-o>

" Yanking: Make Y behave like D and C
nnoremap Y y$

" Function Toggles: Mappings for functions in autoload/evanthegrayt.vim
nnoremap <silent> <Leader>tc :call evanthegrayt#toggle#Conceal()<CR>
nnoremap <silent> <Leader>tC :call evanthegrayt#toggle#ColorColumn()<CR>
nnoremap <silent> <Leader>ts :setlocal spell! spelllang=en_us<CR>
nnoremap <silent> <Leader>tn :call evanthegrayt#relative_number#Toggle()<CR>
nnoremap <silent> <Leader>tm :call evanthegrayt#toggle#Mouse() <CR>
nnoremap <silent> <leader>tf :call evanthegrayt#toggle#FoldColumn()<CR>
nnoremap <silent> <leader>dt :call evanthegrayt#rails#DescribeTable()<CR>

" List all matches of word under cursor and prompt to jump to one.
nnoremap <leader>co [I:let nr = input("Match: ")<Bar>exe "normal ".nr."[\t"<CR>
"}}}

" PLUGIN SETTINGS {{{1
" NETRW: file browser
let g:netrw_home = $HOME . "/.vim/cache"
nnoremap <silent> <leader>nt :Ntree<CR>
" Workaround for broken 'gx'
nnoremap gx yiW:!open <cWORD><CR> <C-r>" & <CR><CR>

" RAINBOW: Different color parens
let g:rainbow_active = 0
nnoremap <silent> <Leader>rt :RainbowToggle<CR>

" SUPERTAB: tab auto-completion when in insert-mode
let g:SuperTabDefaultCompletionType = 'context'
augroup vimrc_supertab
  autocmd!
  autocmd FileType *
        \ if !empty(&omnifunc) | call SuperTabChain(&omnifunc, "<c-p>") | endif
augroup END

" RUBOCOP: debug ruby
let g:ruby_debugger_progname = 'mvim'

" UPDATE PLUGINS: update plugins from vim
let g:update_plugins_exclude = ['update-plugins']
let g:update_plugins_directory = $HOME . "/.vim/pack/*/{start,opt}"

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
if executable('standardrb')
  let g:ale_fixers = { 'ruby': 'standardrb' }
  let g:ale_ruby_rubocop_executable = 'standardrb'
endif

" let g:ale_completion_enabled = 1

" INDENT LINE: draw lines every indention level
let g:indentLine_color_term = 239
let g:indentLine_enabled    = 1
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
nnoremap <silent> <Leader>it :IndentLinesToggle<CR>

" GITGUTTER: show diff in gutter
nnoremap <silent> <Leader>gt :GitGutterBufferToggle<CR>
nnoremap <silent> <Leader>gu :GitGutterUndoHunk<CR>
let g:gitgutter_preview_win_floating = 1

" TAGBAR: show classes/methods/functions in side window
nnoremap <silent> <Leader>TT :Tagbar<CR>
if executable('/opt/homebrew/bin/ctags')
  let g:tagbar_ctags_bin = '/opt/homebrew/bin/ctags'
endif

" UNDOTREE: Visualize the undo tree
if has("persistent_undo")
  set undofile
  let &undodir = $HOME . "/.vim/cache/undo//"
endif

" CTRLP: project file search
let g:ctrlp_extensions = ['tag', 'buffertag']
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = 'node_modules\|DS_STORE\|git\|vendor\|public\|tmp'
let g:ctrlp_cache_dir = $HOME . "/.vim/cache/ctrlp"
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
let g:splitjoin_curly_brace_padding = 0

" EASTEREGG: my colorscheme
let g:easteregg_use_italics = 1
colorscheme easteregg

" GUTENTAGS: Tags manager
let g:gutentags_enabled = 1
" TODO: For some reason, rspec files make ctags hang?
let g:gutentags_ctags_exclude = ['node_modules', 'vendor', 'public', '*.md',
      \ '*.css', '*.html', '*.svg', '*.json', '*.xml', '*_spec.rb']
if executable('/opt/homebrew/bin/ctags')
  let g:gutentags_ctags_executable='/opt/homebrew/bin/ctags'
endif
if executable('ripper-tags')
  let g:gutentags_ctags_executable_ruby='ripper-tags'
endif

" NOTEWORTHY: Notes
let g:noteworthy_libraries = {
      \   'code':     $HOME . '/workflow/notes/code',
      \   'personal': $HOME . '/Documents/notes',
      \   'ps':       $HOME . '/workflow/notes/public_strategies',
      \   'wm':       $HOME . '/workflow/notes/weedmaps'
      \ }
let g:noteworthy_default_library = 'ps'
let g:noteworthy_dynamic_libraries = {
      \   $HOME . '/workflow/srae-pas-dashboard': 'doc/notes',
      \   $HOME . '/workflow/fasttrac-backend': 'docs',
      \   $HOME . '/workflow/fe-backend': 'docs',
      \ }
let g:noteworthy_dynamic_library_name = 'project'
let g:noteworthy_cache_dir = $HOME . '/.vim/cache/noteworthy'

" RI: Browse ruby's RI documentation through vim.
let g:ri_no_mappings = 1

" Move: Move lines and selections.
let g:move_key_modifier = 'C'

" CDC: Easily change directory. Not an actual plugin.
let g:cdc_dirs = [
      \   $HOME . '/.oh-my-zsh/custom/plugins',
      \   $HOME . '/workflow',
      \   $HOME . '/workflow/vagrant-ofa/src',
      \   $HOME . '/.vim/pack/evanthegrayt/start',
      \   $HOME . '/.vim/pack/public-strategies/opt'
      \ ]

let g:branch_sessions_directory = $HOME . '/.vim/cache/sessions'
let g:branch_session_mksession_bang = 1

" REST Console: Run curl through vim.
let g:vrc_curl_opts = {'-i': '', '-s': ''}
let g:vrc_set_default_mapping = 0
let g:vrc_auto_format_response_patterns = {
      \   'json': "ruby -e \"require 'json'; puts JSON.pretty_generate(JSON.parse(ARGF.read))\"",
      \   'xml': 'xmllint --format -',
      \ }
nnoremap <silent> <Leader>rc :call evanthegrayt#rest#CloseResponseBuffer()<CR>


" Lovehandle: Database URL manager.
let g:lovehandle_projects = {
      \   $HOME . '/workflow/bluegrass': '.vimrc'
      \ }

let g:evanthegrayt_jira_board_url = 'https://publicstrategies.atlassian.net'
"}}}

" GUI: GUI-specific settings {{{
if has('gui_running')
  set guioptions-=L
  set guioptions-=l
  set guioptions-=R
  set guioptions-=r
  set vb t_vb=
  set showcmd
  set mouse=

  if has('gui_gtk2')
    set guifont=Monospace\ 9
  elseif has("gui_macvim")
    set guifont=Hack:h13,Monaco:h13
  elseif has("gui_win32") || has("gui_win64")
    set guifont=Consolas:h11:cANSI
  endif
endif
"}}}

" Autocommands: Non-filetype-related autocommands {{{
augroup vimrc
  autocmd!
  " Set backup extension. Saves one backup per file per hour, per day.
  autocmd BufWritePre * let &backupext = '.' . strftime("%Y%m%d%H")
  " Turn off auto-comments on return.
  autocmd FileType * setlocal fo-=c fo-=r fo-=o
  autocmd BufWritePost *
        \ if !(empty(expand('%')) || &buftype =~ 'nofile') | mkview | endif
  autocmd BufReadPost *
        \ if !(empty(expand('%')) || &buftype =~ 'nofile') | silent loadview | endif
  " Global syntax hightligting for NOTE, etc. in comments.
  autocmd Syntax * syn match MyTodo /\v<(HACK|FIXME|NOTE|TODO)/
        \ containedin=.*Comment,vimCommentTitle
  hi def link MyTodo Todo
augroup END

augroup skeletons
  autocmd!
  autocmd BufNewFile README.md 0r ~/skeletons/readme.md
augroup END
"}}}

" LOCAL: source ~/.vimrc.local if it exists {{{
if filereadable($HOME . "/.vimrc.local")
  source $HOME/.vimrc.local
endif
"}}}

" vi: set et ft=vim foldenable foldmethod=marker ts=2 sw=2 sts=2:
