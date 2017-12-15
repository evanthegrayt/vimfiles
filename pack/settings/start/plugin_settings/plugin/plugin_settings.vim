" Plugin Settings

" Only use plugins if version is > 7.1
if !(v:version >= 701 && !&diff)
  echo "Vim version less than 7.01; disabling plugins."
  finish
endif

" DEBUG RUBY: debug ruby
let g:ruby_debugger_progname = 'mvim'

" UPDATE PLUGINS: update plugins from vim
let g:update_plugins_exclude = ['update-plugins']
let g:update_plugins_print_results = 1
let g:update_plugins_directory = '/Users/erg/.vim/pack/*/start/'

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

" VBLOCKMV: move visual blocks around when in visual mode
vnoremap <expr> <S-h> DVB_Drag('left')
vnoremap <expr> <S-l> DVB_Drag('right')
vnoremap <expr> <S-j> DVB_Drag('down')
vnoremap <expr> <S-k> DVB_Drag('up')

" CTRLP: project file search
let g:ctrlp_working_path_mode = 'ra'

" ROOTER: set root directory at begiining of project
let g:rooter_patterns = ['Rakefile', '.git/']
let g:rooter_silent_chdir = 1

" SEARCH PULSE: highlight cursor after search
let g:vim_search_pulse_disable_auto_mappings = 1
let g:vim_search_pulse_mode = 'cursor_line' " 'pattern'
nnoremap <silent> <Leader>p :call search_pulse#Pulse()<CR>
let g:bufExplorerSplitHorzSize = 10
let g:splitjoin_align = 1

" ACK: better searching
if executable('ag')
  nnoremap <Leader>a :Ack!<Space>
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif

" EASTEREGG: my colorscheme
"let g:easteregg_use_italics = 1 " Use italics
colorscheme easteregg       " Set my colorscheme

