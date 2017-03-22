" Environment
set nocompatible " Make Vim more useful

" Windows Compatiblity
if has('win32') || has('win64')
  set runtimepath+=~/.vim/bundle/vundle.vim
  set renderoptions=
endif

" Plugins
set langmenu=en_US.UTF-8
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Themes
Plugin 'altercation/vim-colors-solarized'

" Helpers
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'godlygeek/tabular'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Plugin 'airblade/vim-gitgutter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'osyo-manga/vim-over'
Plugin 'nathanaelkane/vim-indent-guides'

" File formats

Plugin 'PProvost/vim-ps1' " PowerShell
Plugin 'pangloss/vim-javascript' " Javascript
Plugin 'elzr/vim-json' " JSON
let g:vim_json_syntax_conceal = 0
Plugin 'leafgarland/typescript-vim' " TypeScript
Plugin 'hail2u/vim-css3-syntax' " HTML & CSS
Plugin 'digitaltoad/vim-pug' " Pug (formerly Jade
Plugin 'chrisbra/csv.vim' " CSV

call vundle#end()

set modelines=0                                         " turn off modelines for security
set fileformats=unix,dos,mac                            " file format order
set fileformat=unix
set fileencoding=utf-8                                  " format for new files
set fileencodings=utf-8,ucs-bom,utf-16le,default,latin1 " formats to try when reading files
set encoding=utf-8

                                                        " General
syntax on                                               " enable syntax highlighting
scriptencoding utf-8                                    " specifies the encoding used for the remainder of the script
set autochdir                                           " automatically cd into the directory of the current file
set autowrite                                           " automatically write to disk when leaving a buffer
set background=dark                                     " use a light background
set backspace=indent,eol,start                          " makes backspace more flexible
set nobackup                                            " turn on backups
set clipboard+=unnamed                                  " allow access to the windows clipboard
set hidden                                              " allow change of buffers witout saving
set history=1000                                        " store lots of history (default is 20)
set iskeyword +=_,$,@,$,#                               " none of these are word dividers
set mouse=a                                             " enable mouse usage
set noerrorbells                                        " quiet
set shortmess+=filmnrxoOtT                              " abbreviate status line messages (avoids 'hit enter')
set undofile                                            " persist undo information across sessions by storing info in a file
set undolevels=1000                                     " maximum number of changes that can be undone
set undoreload=10000                                    " maximum number lines to save for undo on a buffer reload
set viewoptions=folds,options,cursor,unix,slash         " better unix / windows compatibility
set virtualedit=onemore                                 " allow for cursor beyond last character
set whichwrap=<,>,[,]                                   " Arrow keys move between lines in all modes
set wildmenu                                            " turn on command line completion wild style
set wildmode=list:longest,full                          " lists longest matching string from possibles
set browsedir=buffer                                    " default to open from current buffer's directory
set showmode                                            " show the current mode
set showcmd
set shortmess+=filmnrxoOtT                              " Abbrev. of messages (avoids 'hit enter')
set relativenumber
let g:autoclose_vim_commentmode = 1                     " Disable autoclose in vimrc files
set relativenumber

                                                        " UI
if has("gui_running")
  set guioptions-=T " Remove toolbar
  if has("gui_win32") " If MS Windows
    set guifont=Consolas:h10
    " set renderoptions=type:directx,gamma:1.8,contrast:0.5,geom:1,renmode:5,taamode:1,level:0.5
  endif
endif
set cursorcolumn " Highlights the current column
set cursorline " Highlights the current line
set colorcolumn=80 "highlight column 80
set laststatus=2 " Always show the status line
set showmatch " Turn on matching brackets
set matchtime=5 " Blink matching brackets for 0.5 seconds
set novisualbell " Quiet
set startofline " Leave cursor alone
set number " Display line numbers
set showcmd " Display the command being typed
set scrolloff=3 " Always display 10 lines around cursor
set statusline=%f " full path
set statusline+=%m " modified flag
set statusline+=%r " readonly flag
set statusline+=%h "help flag
set statusline+=%w "preview flag
set statusline+=%{fugitive#statusline()}
set statusline+=[%L] "line count
set statusline+=[%{&ff}][%{&fenc}] " fileformat & encoding
set statusline+=%y " syntax highlighting mode
set statusline+=[%p%%] " percentage into file
set statusline+=[%04l,%04v] " current line and column

" Text Formatting & Layout
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
set smartindent
set ttyfast
set laststatus=2

let mapleader = ","

" Disable folding
set nofoldenable

" Search
" Enable very magic
nnoremap / /\v
vnoremap / /\v
set ignorecase " Ignore case
set smartcase " Smart case
set infercase " Infer case
set gdefault
set incsearch " Search as you type

" Navigation
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
nnoremap ; :
au FocusLost * :wa

filetype on
filetype plugin indent on
syntax enable
colorscheme solarized

" NERDTree
let g:NERDTreeIndicatorMapCustom = {
  \ "Modified"  : "✹",
  \ "Staged"    : "✚",
  \ "Untracked" : "✭",
  \ "Renamed"   : "➜",
  \ "Unmerged"  : "═",
  \ "Deleted"   : "✖",
  \ "Dirty"     : "✗",
  \ "Clean"     : "✔︎",
  \ 'Ignored'   : '☒',
  \ "Unknown"   : "?"
\ }

let g:NERDTreeDirArrowExpandable = "▸"
let g:NERDTreeDirArrowCollapsible = "▾"

" NERDCommenter

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Mappings
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
" Remap split navigation to Ctrl-HJKL
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>


" Functions
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

autocmd vimenter * NERDTree
