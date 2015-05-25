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
if has('vim_starting')
    set nocompatible
    filetype off

    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

let g:make = 'make'

" -------------------------------------
"  Neobundle settings
" -------------------------------------

call neobundle#begin(expand('~/.vim/bundle/'))

" -------------------------------------
"  Essential Plugins
" -------------------------------------

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'tpope/vim-sensible'
NeoBundle 'Shougo/vimproc.vim', {'build': {'unix': g:make}}

" -------------------------------------
"  Productivity Plugins
" -------------------------------------

NeoBundle 'Shougo/unite.vim'
" NeoBundle 'dwieeb/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'tacroe/unite-mark'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'kshenoy/vim-signature'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-unimpaired'
" NeoBundle 'severin-lemaignan/vim-minimap' " This one is one to watch -- Sublime-like minimap
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'rhysd/clever-f.vim'
NeoBundle 'wellle/targets.vim'

" -------------------------------------
"  Integration Plugins
" -------------------------------------

" go
NeoBundle 'jnwhiteh/vim-golang'
" scala
NeoBundle 'derekwyatt/vim-scala'
" php
NeoBundle 'evidens/vim-twig'
NeoBundle 'vim-scripts/smarty-syntax'
NeoBundle 'dwieeb/php-getter-setter.vim'
" rust
NeoBundle 'wting/rust.vim'
" gpg
NeoBundle 'jamessan/vim-gnupg'
" misc
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-fugitive'
" coffee
NeoBundle 'kchmck/vim-coffee-script'
" scss
NeoBundle 'cakebaker/scss-syntax.vim'

" -------------------------------------
"  Appearance & Theme Plugins
" -------------------------------------

NeoBundle 'bling/vim-airline'
NeoBundle 'dwieeb/molokai'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'edkolev/tmuxline.vim'

" -------------------------------------
"  Misc. Awesome Plugins
" -------------------------------------

NeoBundle 'supermomonga/jazzradio.vim'
NeoBundle 'mattn/flappyvird-vim'
NeoBundle 'vim-scripts/TeTrIs.vim'

call neobundle#end()

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

set completeopt-=preview

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
set relativenumber
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
set diffopt+=vertical

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
call unite#custom#profile('default', 'context.smartcase', 1)
call unite#custom#profile('default', 'context.ignorecase', 1)
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
"  vimfiler settings
" ------------------------------------

let g:vimfiler_as_default_explorer = 1

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

autocmd BufWritePost ~/.vimrc source ~/.vimrc
autocmd BufReadPre *.scss setlocal tabstop=2 | setlocal softtabstop=2 | setlocal shiftwidth=2
autocmd BufReadPre *.scala setlocal tabstop=2 | setlocal softtabstop=2 | setlocal shiftwidth=2
autocmd BufReadPre *.coffee setlocal tabstop=2 | setlocal softtabstop=2 | setlocal shiftwidth=2
autocmd BufReadPre *.rst setlocal textwidth=80
autocmd BufReadPre *.php setlocal nocursorline
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif"`'")"'")

" -------------------------------------
"  Filetype settings for extensions
" -------------------------------------

au BufRead,BufNewFile *.wsgi set filetype=python
au BufRead,BufNewFile *.tmpl set filetype=smarty
au BufRead,BufNewFile *.module set filetype=php
au BufRead,BufNewFile *.install set filetype=php
au BufRead,BufNewFile *.schema set filetype=javascript

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
nnoremap <Space>p :Unite -start-insert -no-split file_rec/git<cr>
nnoremap <Space>f :Unite -start-insert -no-split file file/new directory/new<cr>
nnoremap <Space>b :Unite -start-insert -no-split buffer<cr>
nnoremap <Space>y :Unite -start-insert -no-split history/yank<cr>
nnoremap <Space>o :Unite -start-insert -no-split outline<cr>
nnoremap <Space>/ :Unite -start-insert -no-split grep:.<cr>

" Neocomplete
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" EasyMotion
nmap s <Plug>(easymotion-s)

" -------------------------------------
"  Source a .vimrc.local if it exists
" -------------------------------------

if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

NeoBundleCheck
