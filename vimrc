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

set nocompatible " </3 vi
filetype off

runtime macros/matchit.vim

packloadall

" ------------------------------------
"  vim-go settings
" ------------------------------------

" format with goimports instead of gofmt
let g:go_fmt_command = "goimports"

" ------------------------------------
"  rust.vim settings
" ------------------------------------

let g:rustfmt_autosave = 1

" ------------------------------------
"  syntastic settings
" ------------------------------------

let g:syntastic_html_tidy_ignore_errors = [
    \ '<ion-',
    \ '<ui-',
    \ 'discarding unexpected </ion-',
    \ 'discarding unexpected </ui-',
    \ 'proprietary attribute "ng-',
    \ 'proprietary attribute "on',
    \ 'trimming empty <i>' ]

let g:syntastic_quiet_messages = {
    \ "type": "style",
    \ "regex": "main redeclared in this block"}

" ------------------------------------
"  coc.nvim settings
" ------------------------------------

set updatetime=300
set signcolumn=yes
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" ------------------------------------
"  airline settings
" ------------------------------------

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#enabled = 0
let g:airline_theme = 'jellybeans'

" ------------------------------------
"  Unite settings
" ------------------------------------

call unite#custom#source('file_rec, file_rec/async, file_rec/git', 'matchers', ['converter_relative_word', 'matcher_fuzzy'])
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
"  tmuxline settings
" ------------------------------------

" :Tmuxline airline to set manual colors
" :TmuxlineSnapshot! tmuxline.conf to save colors
let g:tmuxline_preset = 'nightly_fox'
let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '>',
    \ 'right' : '',
    \ 'right_alt' : '<',
    \ 'space' : ' '}

" -------------------------------------
"  netrw settings
" -------------------------------------

let g:netrw_liststyle = 3

" -------------------------------------
"  autocommands
" -------------------------------------

autocmd FileType python BracelessEnable +indent
autocmd BufEnter *.js setlocal tabstop=2 | setlocal softtabstop=2 | setlocal shiftwidth=2
autocmd BufEnter *.ts,*tsx setlocal tabstop=2 | setlocal softtabstop=2 | setlocal shiftwidth=2
autocmd BufEnter *.go setlocal tabstop=4 | setlocal softtabstop=4 | setlocal shiftwidth=4 | setlocal noexpandtab
autocmd BufEnter *.yml setlocal tabstop=2 | setlocal softtabstop=2 | setlocal shiftwidth=2
autocmd BufEnter *.css setlocal tabstop=2 | setlocal softtabstop=2 | setlocal shiftwidth=2
autocmd BufEnter *.scss setlocal tabstop=2 | setlocal softtabstop=2 | setlocal shiftwidth=2
autocmd BufEnter *.rst setlocal textwidth=80
autocmd BufEnter *.md setlocal textwidth=80
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif"`'")"'")

let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

autocmd CursorHold * silent call CocActionAsync('highlight')

" -------------------------------------
"  Filetype settings for extensions
" -------------------------------------

autocmd BufRead,BufNewFile *.jsx set filetype=javascript.tsx
autocmd BufRead,BufNewFile *.tsx set filetype=typescript.tsx
autocmd BufRead,BufNewFile *.wsgi set filetype=python

" -------------------------------------
"  General settings
" -------------------------------------

filetype plugin indent on

set mouse=

" When searching try to be smart about cases
set smartcase

" For regular expressions turn magic on
set magic " yer a wizard harry

" Let me hide a buffer with changes
set hidden

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
set showcmd
set cmdheight=2

if !has("nvim")
    set lazyredraw
end

colorscheme jellybeans

" -------------------------------------
"  File & backup settings
" -------------------------------------

set nobackup
set nowritebackup
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
set emoji

" -------------------------------------
"  Keyboard shortcuts
" -------------------------------------

let mapleader="\<Space>"

inoremap jk <Esc>

" Ex mode: no ty
map Q <Nop>

" Disable accidental macro recording when I spaz out on the q key
map qq <Nop>

nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" tabs
nnoremap gwN :tabnew<cr>
nnoremap gwC :tabclose<cr>
nnoremap gwT :wincmd T<cr>

" reselect visual block after indent
vnoremap < <gv
vnoremap > >gv

" Unite
nnoremap <Leader>p :Unite -start-insert -no-split -no-resize file_rec/git<cr>
nnoremap <Leader>f :Unite -start-insert -no-split -no-resize file file/new directory/new<cr>
nnoremap <Leader>b :Unite -start-insert -no-split -no-resize buffer<cr>
nnoremap <Leader>y :Unite -start-insert -no-split -no-resize history/yank<cr>
nnoremap <Leader>o :Unite -start-insert -no-split -no-resize outline<cr>
nnoremap <Leader>/ :Unite -start-insert -no-split -no-resize -no-empty grep/git:.<cr>

" coc.nvim
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

" Commands
command! W w
command! Q q

" -------------------------------------
"  Source a .vimrc.local if it exists
" -------------------------------------

if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
