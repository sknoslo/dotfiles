set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage itself
Plugin 'gmarik/Vundle.vim'

Plugin 'sjl/gundo.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'jiangmiao/auto-pairs'
Plugin 'gregsexton/MatchTag'

call vundle#end()
filetype plugin indent on
set autoindent " insert new line at same indent level

syntax enable "enable syntax processing

set shiftwidth=2 "width of indent
set tabstop=2 "size of tabs
set expandtab "expand tabs into spaces

set showcmd "show command in bottom bar

set cursorline "highlight current line

set so=10 "cursor 10 lines from edge

set t_Co=256

filetype indent on " load filetype specific indent files

set wildmenu " visual autocomplete for command menu

set lazyredraw " dont redraw if you don't have to

set showmatch " highlight matching [{()}]

""" SEARCH SETTINGS
set incsearch " search as characters are entered
set hlsearch " highlight matches

nnoremap <leader><space> :nohlsearch<CR>

""" CODE FOLDING
set foldenable " enable folding
set foldlevelstart=10 " open most by default
set foldnestmax=10 " 10 nested folds max

" set space to (un)fold
nnoremap <space> za
set foldmethod=indent " fold based on indent level

""" KEYBINDINGS
let mapleader="," " leader is a comma

" toggle gundo (undo tree viewer)
nnoremap <leader>u :GundoToggle<CR>

" save session
nnoremap <leader>s :mksession<CR>

map <C-h> :tabp<CR>
map <C-l> :tabn<CR>

" FUNCTIONS

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-m> :call NumberToggle()<CR>
