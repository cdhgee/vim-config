" Modeline and Notes {
"   vim: set foldmarker={,} foldlevel=0
" }

" Environment {
  set nocompatible " Make Vim more useful
  " Windows Compatiblity {
    " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
    " across (heterogeneous) systems easier.
    if has('win32') || has('win64')
      set runtimepath+=~/.vim/bundle/vundle.vim
    endif
  " }
  "

" Plugins {
"
  call vundle#begin()

  Plugin 'gmarik/Vundle.vim'
  Plugin 'altercation/vim-colors-solarized'
  Plugin 'tpope/vim-surround'
  Plugin 'tpope/vim-repeat'
  Plugin 'terryma/vim-multiple-cursors'
  Plugin 'bling/vim-airline'
  Plugin 'bling/vim-bufferline'
  Plugin 'osyo-manga/vim-over'
  Plugin 'nathanaelkane/vim-indent-guides'

  " Language support

  "PowerShell
  Plugin 'PProvost/vim-ps1'

  " Javascript & JSON
  Plugin 'pangloss/vim-javascript'
  Plugin 'elzr/vim-json'
  let g:vim_json_syntax_conceal = 0

  " CoffeeScript
  Plugin 'kchmck/vim-coffee-script'

  " TypeScript
  Plugin 'leafgarland/typescript-vim'

  " HTML
  Plugin 'amirh/HTML-AutoCloseTag'
  Plugin 'hail2u/vim-css3-syntax'

  call vundle#end()

"

  set fileformats=unix,dos,mac " file format order
  set fileformat=unix

" General {
  syntax on " enable syntax highlighting
  scriptencoding utf-8 " not entirely sure what this does, but hey, whatever
  set autochdir " automatically cd into the directory of the current file
  set autowrite " automatically write to disk when leaving a buffer
  set background=light " use a light background
  set backspace=indent,eol,start " makes backspace more flexible
  set nobackup " turn on backups
  set clipboard+=unnamed " allow access to the windows clipboard
  set hidden "allow change of buffers witout saving
  set history=1000 "store lots of history (default is 20)
  set iskeyword +=_,$,@,$,# " none of these are word dividers
  set mouse=a " enable mouse usage
  set noerrorbells " quiet
  set shortmess+=filmnrxoOtT " abbreviate status line messages (avoids 'hit enter')
  set undofile " persist undo information across sessions by storing info in a file
  set undolevels=1000 "maximum number of changes that can be undone
  set undoreload=10000 "maximum number lines to save for undo on a buffer reload
  set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
  set virtualedit=onemore       " allow for cursor beyond last character
  set whichwrap=<,>,[,] " Arrow keys move between lines in all modes
  set wildmenu " turn on command line completion wild style
  set wildmode=list:longest " lists longest matching string from possibles
  set browsedir=buffer " default to open from current buffer's directory
  set showmode " show the current mode
  set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
  let g:autoclose_vim_commentmode = 1 " Disable autoclose in vimrc files
 " }

" UI {
  if has("gui_running")
    "colorscheme solarized
    set guioptions-=T " Remove toolbar
    if has("gui_win32") " If MS Windows
      set guifont=Consolas:h10:b
    endif
  endif
  set cursorcolumn " Highlights the current column
  set cursorline " Highlights the current line
  set colorcolumn=80 "highlight column 80
  set incsearch " Search as you type
  set laststatus=2 " Always show the status line
  set showmatch " Turn on matching brackets
  set matchtime=5 " Blink matching brackets for 0.5 seconds
  set novisualbell " Quiet
  set nostartofline " Leave cursor alone
  set number " Display line numbers
  set showcmd " Display the command being typed
  set scrolloff=10 " Always display 10 lines around cursor
  set statusline=%f " full path
  set statusline+=%m " modified flag
  set statusline+=%r " readonly flag
  set statusline+=%h "help flag
  set statusline+=%w "preview flag
  set statusline+=[%L] "line count
  set statusline+=[%{&ff}][%{&fenc}] " fileformat & encoding
  set statusline+=%y " syntax highlighting mode
  set statusline+=[%p%%] " percentage into file
  set statusline+=[%04l,%04v] " current line and column
" }

" Text Formatting & Layout {
  set expandtab " Expand tabs to spaces
  set smarttab " Indent to same level as previous line
  set shiftwidth=2 " Auto-indent width
  set softtabstop=2 " Number of spaces to enter when tab is hit
  set tabstop=2 " Real tab stop
  set wrap " Turn on line wrapping
  set nolist "list disables linebreaks
  set linebreak "turn on line breaks
  set textwidth=0 "Prevent hard line breaks being auto inserted
  set wrapmargin=0 "Ditto
  set ignorecase " Ignore case
  set smartcase " Smart case
  set infercase " Infer case
  set smartindent
  filetype on
  syntax enable
  filetype plugin indent on
  colorscheme solarized
" }

" Folding {
  set foldenable "Enable folding
  set foldmethod=indent
" }

" Tabs {

  " tab navigation like firefox
  nnoremap <C-S-tab> :tabprevious<CR>
  nnoremap <C-tab>   :tabnext<CR>
  nnoremap <C-t>     :tabnew<CR>
  inoremap <C-S-tab> <Esc>:tabprevious<CR>i
  inoremap <C-tab>   <Esc>:tabnext<CR>i
  inoremap <C-t>     <Esc>:tabnew<CR>

  " open all files in tabs
  ""autocmd VimEnter * tab all
  ""autocmd BufAdd * exe 'tablast | tabe "' . expand( "<afile") .'"'

"}

"Auto Commands {



  set autochdir " Automatically cd into the directory that the file is in
  autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif " Remove any trailing whitespace that is in the file

  augroup JumpCursorOnEdit " Restore cursor position to where it was before {
    autocmd!
    autocmd BufReadPost *
      \ if expand("<afile>:p:h") !=? $TEMP |
      \   if line("'\"") > 1 && line("'\"") <= line("$") |
      \     let JumpCursorOnEdit_foo = line("'\"") |
      \     let b:doopenfold = 1 |
      \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
      \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
      \        let b:doopenfold = 2 |
      \     endif |
      \     exe JumpCursorOnEdit_foo |
      \   endif |
      \ endif

    autocmd BufReadPost *
     \ if &modifiable |
     \   retab |
     \ endif

    autocmd BufWinEnter * " Need to postpone using "zv" until after reading the modelines.
      \ if exists("b:doopenfold") |
      \   exe "normal zv" |
      \   if(b:doopenfold > 1) |
      \       exe  "+".1 |
      \   endif |
      \   unlet b:doopenfold |
      \ endif
  augroup END
  " }
"}

" Mappings {
  " Map control-right to next tab
  nnoremap <silent> <C-right> :tabnext<CR>
  " Map control-left to prev tab
  nnoremap <silent> <C-left> :tabprevious<CR>
  " Space toggles folds
  nnoremap <space> za
  " Shift-space expands all folds
  nnoremap <S-space> zR
  " Some standard windows key mappings
  vnoremap <C-X> "+x
  vnoremap <C-C> "+y
  vnoremap <C-V> "+gP
  map <C-Z> u
  map <C-Y> <C-R>
  cmap <C-V> <C-R>+
  " Search mappings, center on line that's found
  map N Nzz
  map n nzz
  " Alias :nt to :tabnew
  cabbrev nt tabnew
  " Convenient shortcuts to correct typos
  cabbrev WQ wq
  cabbrev Wq wq
  cabbrev wQ wq
  cabbrev W w
  cabbrev Q q
" }

" GUI {
" }

" Functions {
function! InitializeDirectories()
  let separator = "."
  let parent = $HOME
  let prefix = '.vim'
  let dir_list = {
        \ 'backup': 'backupdir',
        \ 'views': 'viewdir',
        \ 'swap': 'directory',
        \ 'undo': 'undodir' }

  for [dirname, settingname] in items(dir_list)
    let directory = parent . '/' . prefix . dirname . "/"
    if exists("*mkdir")
      if !isdirectory(directory)
        call mkdir(directory)
      endif
    endif
    if !isdirectory(directory)
      echo "Warning: Unable to create backup directory: " . directory
      echo "Try: mkdir -p " . directory
    else
          let directory = substitute(directory, " ", "\\\\ ", "")
          exec "set " . settingname . "=" . directory
    endif
  endfor
endfunction
call InitializeDirectories()
" }
"
