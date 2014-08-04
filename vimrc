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

" </3 vi
set nocompatible
filetype off

" -------------------------------------
"  Vundle settings
" -------------------------------------

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" -------------------------------------
"  Essential Plugins
" -------------------------------------

Plugin 'gmarik/vundle'
Plugin 'tpope/vim-sensible'
Plugin 'Shougo/vimproc.vim'

" -------------------------------------
"  Productivity Plugins
" -------------------------------------

Plugin 'Shougo/unite.vim'
" Plugin 'dwieeb/unite.vim'
Plugin 'Shougo/unite-outline'
Plugin 'tacroe/unite-mark'
Plugin 'ujihisa/unite-colorscheme'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tomtom/tcomment_vim'
Plugin 'kshenoy/vim-signature'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'
Plugin 'jiangmiao/auto-pairs'
" Plugin 'severin-lemaignan/vim-minimap' " This one is one to watch -- Sublime-like minimap
Plugin 'nathanaelkane/vim-indent-guides'

" -------------------------------------
"  Integration Plugins
" -------------------------------------

Plugin 'tpope/vim-fugitive'
Plugin 'jnwhiteh/vim-golang'
" Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/smarty-syntax'

" -------------------------------------
"  Appearance & Theme Plugins
" -------------------------------------

Plugin 'bling/vim-airline'
Plugin 'dwieeb/molokai'
Plugin 'nanotech/jellybeans.vim'
Plugin 'edkolev/tmuxline.vim'

" -------------------------------------
"  General settings
" -------------------------------------

filetype plugin indent on

set mouse=a

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

set wildignore+=*.db,*.o,*.obj
set wildignore+=*.swp,*.bak,*.lock
set wildignore+=*.git,*.svn
set wildignore+=*DS_Store*
set wildignore+=**/tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.app,*.dmg,*.pdf,*.so

" -------------------------------------
"  Appearance settings
" -------------------------------------

colorscheme jellybeans

set background=dark
set t_Co=256
set hlsearch
set cursorline
set listchars=tab:>~,nbsp:_,trail:.
set list
set number
set numberwidth=5

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
set nojoinspaces

" ------------------------------------
"  molokai settings
" ------------------------------------

let g:molokai_original = 1

" ------------------------------------
"  airline settings
" ------------------------------------

let g:airline_theme = 'jellybeans'
let g:airline#extensions#tabline#enabled = 1

" ------------------------------------
"  Unite settings
" ------------------------------------

call unite#custom#source('file_rec, file_rec/async, file_rec/git', 'matchers', ['converter_relative_word', 'matcher_fuzzy'])
call unite#custom#source('file_rec, file_rec/async, file_rec/git', 'ignore_pattern', 'java')
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#profile('', 'smartcase', 1)
call unite#custom#profile('', 'ignorecase', 1)
let g:unite_prompt = '» '
let g:unite_source_history_yank_enable = 1

" ------------------------------------
"  Unite mark settings
" ------------------------------------

let g:unite_source_mark_marks =
            \   "abcdefghijklmnopqrstuvwxyz"
            \ . "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

" ------------------------------------
"  neocomplete settings
" ------------------------------------

let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

" ------------------------------------
"  EasyMotion settings
" ------------------------------------

let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_mapping = 0

" ------------------------------------
"  tcomment settings
" ------------------------------------

call tcomment#SetOption("count", 1)
let g:tcomment#blank_lines = 0

" ------------------------------------
"  tmuxline settings
" ------------------------------------

let g:tmuxline_preset = 'nightly_fox'
let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '>',
    \ 'right' : '',
    \ 'right_alt' : '<',
    \ 'space' : ' '}

" -------------------------------------
"  autocommands
" -------------------------------------

autocmd BufWritePost  ~/.vimrc source ~/.vimrc
autocmd BufReadPre *.rst setlocal textwidth=80
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif"`'")"'")
au BufRead,BufNewFile *.tmpl set filetype=smarty

" -------------------------------------
"  Keyboard shortcuts
" -------------------------------------

let mapleader=","

inoremap jk <Esc>

map Q <Nop>
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

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

" It is strange this particular movement happens AND yanks
nnoremap y{ y{}kp
nnoremap y} y}kp

" Unite
nnoremap <C-p> :Unite -start-insert -no-split file_rec/git<cr>
nnoremap <S-p> :Unite -complete -no-split file<cr>
nnoremap <S-b> :Unite -no-split buffer<cr>
nnoremap <S-y> :Unite -no-split history/yank<cr>
nnoremap <Space>o :Unite -no-split outline<cr>
nnoremap <Space>/ :Unite -no-split grep:.<cr>

" Neocomplete
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" EasyMotion
nmap s <Plug>(easymotion-s)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" -------------------------------------
"  Filetype settings for extensions
" -------------------------------------

au BufRead,BufNewFile *.wsgi set filetype=python

" -------------------------------------
"  Source a .vimrc.local if it exists
" -------------------------------------

if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
