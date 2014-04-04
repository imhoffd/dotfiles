" -------------------------------------
"  Maintainer:
"      Daniel Imhoff
"
"  Inspired_by:
"      * https://github.com/feltnerm/dotfiles/blob/master/vimrc
"      * http://amix.dk/vim/vimrc.html
"      * https://github.com/tomasr/dotfiles/blob/master/.vimrc
"
" -------------------------------------


" -------------------------------------
"  General settings
" -------------------------------------

" </3 vi
set nocompatible

" Infect!
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" When searching try to be smart about cases 
set smartcase

" For regular expressions turn magic on
set magic

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" -------------------------------------
"  Appearance settings
" -------------------------------------

set background=dark
set t_Co=256

" ------------------------------------
"  molokai settings
" ------------------------------------

let g:molokai_original = 1
colorscheme molokai

" ------------------------------------
"  airline settings
" ------------------------------------

let g:airline_theme = 'badwolf'

" -------------------------------------
"  File & backup settings
" -------------------------------------

set nobackup
set nowb
set noswapfile

" -------------------------------------
"  Text settings
" -------------------------------------

" Use spaces, damn it!
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set nowrap

" -------------------------------------
"  Keyboard shortcuts
" -------------------------------------

nnoremap <C-p> :Unite file_rec/async<cr>

