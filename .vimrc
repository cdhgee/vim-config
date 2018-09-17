" Environment
set nocompatible " Make Vim more useful

set runtimepath+=~/.vim/bundle/Vundle.vim

" Windows Compatiblity
if has('win32') || has('win64')
  set renderoptions=
endif

" Plugins
set langmenu=en_US.UTF-8
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Themes
Plugin 'altercation/vim-colors-solarized'

" Helpers
" Plugin 'tpope/vim-surround'
" File commands
Plugin 'tpope/vim-eunuch'
" Used by other plugins by tpope
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
" Advanced search/replace
Plugin 'tpope/vim-abolish'
" Auto commenting
Plugin 'tpope/vim-commentary'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'osyo-manga/vim-over'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'w0rp/ale' " Linting
" Code completion
" Plugin 'Valloric/YouCompleteMe'

" File formats

" PowerShell
Plugin 'PProvost/vim-ps1'
" Javascript
Plugin 'pangloss/vim-javascript'
" JSON
Plugin 'elzr/vim-json'
" TypeScript
Plugin 'leafgarland/typescript-vim'
" React TSX
Plugin 'peitalin/vim-jsx-typescript'
" HTML & CSS
Plugin 'hail2u/vim-css3-syntax'
" Pug
Plugin 'digitaltoad/vim-pug'
" CSV
Plugin 'chrisbra/csv.vim'
" React JSX
Plugin 'mxw/vim-jsx'

call vundle#end()

" turn off modelines for security
set modelines=0
" file format order
set fileformats=unix,dos,mac
set fileformat=unix
" format for new files
set fileencoding=utf-8
" formats to try when reading files
set fileencodings=utf-8,ucs-bom,utf-16le,default,latin1
set encoding=utf-8

" General

" enable syntax highlighting
syntax on
" specifies the encoding used for the remainder of the script
scriptencoding utf-8
" automatically cd into the directory of the current file
set autochdir
" automatically write to disk when leaving a buffer
set autowrite
" use a light background
set background=dark
" makes backspace more flexible
set backspace=indent,eol,start
" turn on backups
set nobackup
" allow access to the windows clipboard
set clipboard+=unnamed
" allow change of buffers witout saving
set hidden
" store lots of history (default is 20)
set history=1000
" none of these are word dividers
set iskeyword +=_,$,@,$,#
" enable mouse usage
set mouse=a
" quiet
set noerrorbells
" abbreviate status line messages (avoids 'hit enter')
set shortmess+=filmnrxoOtT
" persist undo information across sessions by storing info in a file
set undofile
set undolevels=1000
" Maximum number lines to save for undo on a buffer reload
set undoreload=10000
" better unix / windows compatibility
set viewoptions=folds,options,cursor,unix,slash
" allow for cursor beyond last character
set virtualedit=onemore
" Arrow keys move between lines in all modes
set whichwrap=<,>,[,]
" turn on command line completion wild style
set wildmenu
" lists longest matching string from possibles
set wildmode=list:longest,full
" default to open from current buffer's directory
set browsedir=buffer
" show the current mode
set showmode
set showcmd
" Abbrev. of messages (avoids 'hit enter')
set shortmess+=filmnrxoOtT
" Disable autoclose in vimrc files
let g:autoclose_vim_commentmode = 1
" Disable relative line numbering
set norelativenumber

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

" Automatically trim trailing whitespace

autocmd BufWritePre * %s/\s\+$//e

" set filetypes as typescript.jsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.jsx

let g:airline#extensions#ale#enabled = 1

" Disable JSON string concealment
let g:vim_json_syntax_conceal = 0
