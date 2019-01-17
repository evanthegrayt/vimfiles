" IF VIM CAN RUN AUTOCMDS

if !has("autocmd")
  finish
endif

augroup vimrc
  " SET BACKUP EXTENSION - will save one backup per file per hour, per day
  autocmd BufWritePre * let &backupext = '.' . strftime("%Y%m%d%H")
  " TURN OFF AUTO-COMMENTS ON RETURN
  autocmd FileType * setlocal fo-=c fo-=r fo-=o
  " RETURN TO LAST EDIT POSITION WHEN RE-OPENING FILES (THIS IS GREAT TO HAVE!)
  autocmd BufNewFile,BufRead vimoutlinerrc setlocal filetype=vim
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$")
        \|  exe "normal! g`\""
        \| endif
  if &diff " diff mode
    setlocal diffopt+=iwhite
  else     " Save folds when opening/leaving files, unless it's a diff
    setlocal viewoptions-=options
    autocmd BufWritePost *
          \   if expand('%') != '' && &buftype !~ 'nofile'
          \|      mkview
          \|  endif
    autocmd BufRead *
          \   if expand('%') != '' && &buftype !~ 'nofile'
          \|      silent loadview
          \|  endif
  endif
  " Nerdtree
  autocmd bufenter *
        \  if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree())
        \|     q
        \| endif
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

augroup end

