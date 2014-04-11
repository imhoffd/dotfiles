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

" Folds
" set foldmethod=indent

set cursorline
set shellcmdflag=-ic

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
"  Unite settings
" ------------------------------------

call unite#custom#source('file_rec,file_rec/async', 'matchers', 'matcher_fuzzy')
call unite#custom#source('file_rec,file_rec/async', 'max_candidates', 0)
call unite#filters#sorter_default#use(['sorter_rank'])
let g:unite_source_history_yank_enable = 1
let g:unite_source_file_rec_max_cache_files = 0
let g:unite_source_rec_async_command = 'ag --nocolor --nogroup --ignore ".git" --hidden -g ""'

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

" reselect visual block after indent
vnoremap < <gv
vnoremap > >gv

nnoremap <C-p> :Unite -start-insert -no-split file_rec/async<cr>
nnoremap <C-b> :Unite -no-split buffer<cr>
nnoremap <space>s :Unite -no-split -quick-match buffer<cr>
nnoremap <space>y :Unite -no-split history/yank<cr>
nnoremap <space>/ :Unite -no-split grep:.<cr>
nnoremap <C-m> :!build_shoutlet<cr>
