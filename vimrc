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
NeoBundle 'kshenoy/vim-signature'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-unimpaired'
" NeoBundle 'severin-lemaignan/vim-minimap' " This one is one to watch -- Sublime-like minimap
NeoBundle 'nathanaelkane/vim-indent-guides'
" NeoBundle 'rhysd/clever-f.vim'
NeoBundle 'unblevable/quick-scope'
NeoBundle 'wellle/targets.vim'
NeoBundle 'tpope/vim-obsession'
NeoBundle 'michaeljsmith/vim-indent-object'

" -------------------------------------
"  Integration Plugins
" -------------------------------------

" go
NeoBundle 'jnwhiteh/vim-golang'
" scala
NeoBundle 'derekwyatt/vim-scala'
" groovy
NeoBundle 'vim-scripts/groovy.vim'
" php
NeoBundle 'evidens/vim-twig'
NeoBundle 'vim-scripts/smarty-syntax'
NeoBundle 'dwieeb/php-getter-setter.vim'
" python
NeoBundle 'hynek/vim-python-pep8-indent'
NeoBundle 'jmcantrell/vim-virtualenv'
" rust
NeoBundle 'wting/rust.vim'
" gpg
NeoBundle 'jamessan/vim-gnupg'
" git
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
" coffee
NeoBundle 'kchmck/vim-coffee-script'
" scss
NeoBundle 'cakebaker/scss-syntax.vim'
" misc
NeoBundle 'scrooloose/syntastic'

" -------------------------------------
"  Appearance & Theme Plugins
" -------------------------------------

NeoBundle 'bling/vim-airline'
NeoBundle 'dwieeb/molokai'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'romainl/Apprentice'
NeoBundle 'edkolev/tmuxline.vim'

call neobundle#end()

" ------------------------------------
"  vim-virtualenv settings
" ------------------------------------

let g:virtualenv_directory = '.'
let g:virtualenv_auto_activate = 0

" I'll do the auto-activation for my workflow, ty!
if filereadable(expand("./venv/bin/activate"))
    call virtualenv#activate("venv")
endif

" ------------------------------------
"  gitgutter settings
" ------------------------------------

let g:gitgutter_realtime = 1

" ------------------------------------
"  syntastic settings
" ------------------------------------

if executable('python3')
    let g:syntastic_python_python_exec = 'python3'
endif

" ------------------------------------
"  molokai settings
" ------------------------------------

let g:molokai_original = 1

" ------------------------------------
"  airline settings
" ------------------------------------

let g:airline_theme = 'jellybeans'
let g:airline#extensions#tabline#enabled = 1
" let g:airline_section_b = '%{virtualenv#statusline()}'

" ------------------------------------
"  Unite settings
" ------------------------------------

call unite#custom#source('file_rec, file_rec/async, file_rec/git', 'matchers', ['converter_relative_word', 'matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#profile('default', 'context.smartcase', 1)
call unite#custom#profile('default', 'context.ignorecase', 1)
let g:unite_prompt = '» '
let g:unite_source_history_yank_enable = 1

if executable('ag')
    let g:unite_source_rec_async_command = 'ag --nocolor --nogroup --hidden -g ""'
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nocolor --nogroup --hidden'
    let g:unite_source_grep_recursive_opt=''
endif

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
autocmd BufReadPre *.js setlocal tabstop=2 | setlocal softtabstop=2 | setlocal shiftwidth=2
autocmd BufReadPre *.go setlocal tabstop=4 | setlocal softtabstop=4 | setlocal shiftwidth=4 | setlocal noexpandtab
autocmd BufReadPre *.css setlocal tabstop=2 | setlocal softtabstop=2 | setlocal shiftwidth=2
autocmd BufReadPre *.scss setlocal tabstop=2 | setlocal softtabstop=2 | setlocal shiftwidth=2
autocmd BufReadPre *.scala setlocal tabstop=2 | setlocal softtabstop=2 | setlocal shiftwidth=2
autocmd BufReadPre *.coffee setlocal tabstop=2 | setlocal softtabstop=2 | setlocal shiftwidth=2
autocmd BufReadPre *.gradle setlocal syntax=groovy
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

set background=dark
set t_Co=256
set hlsearch
set cursorline
set listchars=tab:>~,nbsp:_,trail:.
set list
set number
set relativenumber
set numberwidth=5

colorscheme jellybeans

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

" -------------------------------------
"  Keyboard shortcuts
" -------------------------------------

let mapleader=","

inoremap jk <Esc>

map Q <Nop>
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

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
nnoremap <Space>p :Unite -start-insert -no-split -no-resize file_rec/async<cr>
nnoremap <Space>f :Unite -start-insert -no-split -no-resize file file/new directory/new<cr>
nnoremap <Space>b :Unite -start-insert -no-split -no-resize buffer<cr>
nnoremap <Space>y :Unite -start-insert -no-split -no-resize history/yank<cr>
nnoremap <Space>o :Unite -start-insert -no-split -no-resize outline<cr>
nnoremap <Space>/ :Unite -start-insert -no-split -no-resize grep:.<cr>

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
