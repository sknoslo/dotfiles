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

set number " turn on regular line number
set relativenumber " turn on relative numbers

set laststatus=2
set statusline=\ %t\ %y\ %=%([%l,%v][%p%%]\ %)
hi StatusLine ctermfg=8 ctermbg=14

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

set backspace=2

""" NERDTree settings
let NERDTreeShowHidden=1

""" SEARCH SETTINGS
set incsearch " search as characters are entered
set hlsearch " highlight matches


""" KEYBINDINGS
let mapleader="," " leader is a comma

" clear previous search
nnoremap <leader><space> :let @/ = ""<CR>

" toggle gundo (undo tree viewer)
nnoremap <leader>u :GundoToggle<CR>

" save session
nnoremap <leader>s :mksession<CR>

map <C-h> :tabp<CR>
map <C-l> :tabn<CR>

let g:cycle=0
function! CycleNumberView()
  let g:cycle+=1
  if g:cycle > 3
    let g:cycle = 0
  end
  if g:cycle == 0
    set number
    set relativenumber
  elseif g:cycle == 1
    set number
    set norelativenumber
  elseif g:cycle == 2
    set nonumber
    set relativenumber
  elseif g:cycle == 3
    set nonumber
    set norelativenumber
  endif
endfunction
nnoremap <S-n> :call CycleNumberView()<CR>
