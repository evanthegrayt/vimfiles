" Plugin Settings
filetype off        " Disable filetype detection
set laststatus=2    " Always show the statusline - must be on for airline.
set encoding=utf-8  " Necessary to show unicode glyphs
if has('nvim')
  set rtp+=~/.config/bundle/pathogen/
  call pathogen#infect()
endif
if v:version >= 701 && !&diff " Only use plugins if version is > 7.1
  " Debug ruby
  let g:ruby_debugger_progname = 'mvim'
  " UPDATE PLUGINS (PLUGIN) update plugins from vim
  let g:update_plugins_exclude = ['update-plugins']
  let g:update_plugins_print_results = 1
  let g:update_plugins_directory = '/Users/erg/.vim/pack/*/start/'
  " AIRLINE (PLUGIN) ADVANCED STATUS LINE
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
  " INDENT LINE (PLUGIN) DRAW LINES EVERY INTENTION
  let g:indentLine_color_term = 239
  let g:indentLine_enabled = 1
  let g:indentLine_char = '┊'
  " BUFFERLINE (PLUGIN) SHOW OPEN BUFFERS IN AIRLINE
  let g:bufferline_show_bufnr = 0
  let g:bufferline_echo = 0
  let g:bufferline_active_highlight = 'StatusLine'
  " GITGUTTER (PLUGIN) SHOW DIFF IN GUTTER
  nnoremap <silent> <Leader>gg :GitGutterToggle<CR>
  nnoremap <silent> <Leader>it :IndentLinesToggle<CR>
  " TAGBAR (PLUGIN) SHOW VARIABLES IN WINDOW
  nnoremap <silent> <Leader>TT :Tagbar<CR>
  " NERDTREE (PLUGIN) - A BETTER FILE BROWSER FOR VIM.
  nnoremap <silent> <Leader>nt :NERDTreeToggle<CR>
  " GUNDO (PLUGIN) - A VISUALIZATION OF VIM'S UNTO TREE
  nnoremap <silent> <Leader>gt :GundoToggle<CR>
  " SYNTASTIC (PLUGIN) CHECKS THE SYNTAX OF FILES AND REPORTS ERRORS
  let g:syntastic_check_on_open = 1
  let g:syntastic_enable_signs  = 1
  " VBLOCKMV (PLUGIN) - MOVE VISUAL BLOCKS AROUND WHEN IN VISUAL MODE
  vnoremap <expr> <S-h> DVB_Drag('left')
  vnoremap <expr> <S-l> DVB_Drag('right')
  vnoremap <expr> <S-j> DVB_Drag('down')
  vnoremap <expr> <S-k> DVB_Drag('up')
  " CTRLP (PLUGIN) - PROJECT FILE SEARCH
  let g:ctrlp_working_path_mode = 'ra'
  " ROOTER (PLUGIN) - SET ROOT DIRECTORY AT BEGIINING OF PROJECT
  let g:rooter_patterns = ['Rakefile', '.git/']
  let g:rooter_silent_chdir = 1
  " SEARCH PULSE (PLUGIN) HIGHLIGHT CURSOR AFTER SEARCH
  let g:vim_search_pulse_disable_auto_mappings = 1
  let g:vim_search_pulse_mode = 'cursor_line' " 'pattern'
  nnoremap <silent> <Leader>p :call search_pulse#Pulse()<CR>
  let g:bufExplorerSplitHorzSize = 10
  let g:splitjoin_align = 1
  " BETTER SEARCHING
  if executable('ag')
    nnoremap <Leader>a :Ack!<Space>
    let g:ackprg = 'ag --nogroup --nocolor --column'
  endif
else
  echo "Vim version less than 7.01; disabling plugins."
endif
filetype on                 " Reenable filetype detection
filetype plugin on          " Enable filetype dection for plugins
filetype indent on          " Enable indention by filetype

syntax enable               " Turn on syntax highlighting
let g:easteregg_use_italics = 1 " Use italics
colorscheme easteregg       " Set my super awesome colorscheme!!!!

