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
"  Vundle settings
" -------------------------------------

" </3 vi
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/unite-outline'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'
Plugin 'dwieeb/molokai'
Plugin 'bling/vim-airline'
Plugin 'tomtom/tcomment_vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'kshenoy/vim-signature'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/syntastic'

filetype plugin indent on

" -------------------------------------
"  General settings
" -------------------------------------

" When searching try to be smart about cases
set smartcase

" For regular expressions turn magic on
set magic

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Make esc faster
set esckeys

" Folds
" set foldmethod=indent

" set shellcmdflag=-ci
" set shell=zsh\ -i

" -------------------------------------
"  Appearance settings
" -------------------------------------

set background=dark
set t_Co=256
set hlsearch
set cursorline
set listchars=tab:>~,nbsp:_,trail:.
set list
set number
set numberwidth=5

" ------------------------------------
"  molokai settings
" ------------------------------------

let g:molokai_original = 1
colorscheme molokai

" ------------------------------------
"  Unite settings
" ------------------------------------

call unite#custom#source('file_rec,file_rec/async', 'matchers', ['converter_relative_word', 'matcher_fuzzy'])
call unite#custom#source('file_rec,file_rec/async', 'max_candidates', 0)
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#profile('', 'smartcase', 1)
call unite#custom#profile('', 'ignorecase', 1)
let g:unite_source_history_yank_enable = 1
let g:unite_source_file_rec_max_cache_files = 0
" let g:unite_source_rec_async_command = 'ag --nocolor --nogroup --ignore ".git" --hidden -g ""'

" ------------------------------------
"  neocomplete settings
" ------------------------------------

let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

" ------------------------------------
"  EasyMotion  settings
" ------------------------------------

let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_mapping = 0

" ------------------------------------
"  tcomment settings
" ------------------------------------
call tcomment#SetOption("count", 2)
let g:tcomment#blank_lines = 0

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
"  autocommands
" -------------------------------------

autocmd BufWritePost  ~/.vimrc source ~/.vimrc
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif"`'")"'")

" -------------------------------------
"  Keyboard shortcuts
" -------------------------------------

map 0 ^
map Q <Nop>

nnoremap <Left> :echoe "Use h"<cr>
nnoremap <Right> :echoe "Use l"<cr>
nnoremap <Up> :echoe "Use k"<cr>
nnoremap <Down> :echoe "Use j"<cr>

" tabs
nnoremap gwN :tabnew<cr>
nnoremap gwC :tabclose<cr>
nnoremap gwT :wincmd T<cr>

" reselect visual block after indent
vnoremap < <gv
vnoremap > >gv

" Unite
nnoremap <C-p> :Unite -start-insert -no-split file_rec/async<cr>
nnoremap <S-p> :Unite -start-insert -no-split file<cr>
nnoremap <C-b> :Unite -no-split buffer<cr>
nnoremap <C-y> :Unite -no-split history/yank<cr>
nnoremap <C-h> :Unite -no-split outline<cr>
nnoremap <Space>/ :Unite -no-split grep:.<cr>
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Neocomplete
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" EasyMotion
nmap s <Plug>(easymotion-s)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
