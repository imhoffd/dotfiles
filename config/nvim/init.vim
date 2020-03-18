let s:init = stdpath('config') . '/init.vim'
let s:plug = stdpath('config') . '/plug.vim'
let s:plugdir = stdpath('data') . '/plugged'

if !filereadable(s:plug)
  silent exe '!curl -fLo ' . s:plug . ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | exe 'source ' . s:init
endif

exe 'source ' . s:plug

call plug#begin(s:plugdir)

Plug 'HerringtonDarkholme/yats.vim'
Plug 'airblade/vim-gitgutter'
Plug 'cakebaker/scss-syntax.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'kshenoy/vim-signature'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary', 'tag': 'v0.9' }
Plug 'nanotech/jellybeans.vim', { 'as': 'jellybeans' }
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'prettier/vim-prettier'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'unblevable/quick-scope'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'
Plug 'wellle/targets.vim'

call plug#end()

" FUNCTIONALITY

set expandtab
set hidden
set nobackup
set nojoinspaces
set noswapfile
set nowb
set nowrap
set nowritebackup
set shiftwidth=2
set softtabstop=2
set tabstop=2

command! W w
command! Q q

" APPEARANCE

colorscheme jellybeans

set cmdheight=2
set cursorline
set diffopt+=vertical
set emoji
set guicursor=
set list
set listchars=tab:»·,nbsp:␣,trail:·
set number
set relativenumber
set shortmess+=c
set signcolumn=yes
set updatetime=300
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" PLUGIN SETTINGS

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

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#enabled = 0
let g:airline_theme = 'jellybeans'

let g:clap_theme = 'material_design_dark'
let g:clap_layout = { 'relative': 'editor' }

autocmd User ClapOnEnter call g:clap.display.setbufvar('&relativenumber', 0)

let g:tmuxline_preset = 'nightly_fox'
let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '>',
    \ 'right' : '',
    \ 'right_alt' : '<',
    \ 'space' : ' '}

" yats.vim
hi def link typescriptImport           Include
hi def link typescriptImportType       typescriptImport
hi def link typescriptExport           Include
hi def link typescriptClassStatic      Keyword
hi def link typescriptAliasDeclaration NONE
hi def link typescriptType             NONE
hi def link typescriptTypeParameter    NONE
hi def link typescriptTypeReference    Type
hi def link typescriptInterfaceName    NONE
hi def link typescriptMember           NONE
hi def link typescriptLabel            NONE
hi def link typescriptFuncArg          NONE
hi def link typescriptArrowFuncArg     typescriptFuncArg
hi def link typescriptOperator         Keyword
hi def link typescriptCastKeyword      Keyword
hi def link typescriptCall             NONE
hi def link typescriptFuncType         NONE
hi def link typescriptProp             NONE
hi def link typescriptDateMethod       typescriptProp
hi def link typescriptDOMEventMethod   typescriptProp

" KEY MAPPINGS

let mapleader="\<Space>"

inoremap jk <Esc>

map Q <Nop>
map qq <Nop>

nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

vnoremap < <gv
vnoremap > >gv

nnoremap <Leader>p :Clap files<cr>
nnoremap <Leader>b :Clap buffers<cr>
nnoremap <Leader>y :Clap yanks<cr>
nnoremap <Leader>/ :Clap grep<cr>
nnoremap <Leader>e :e <C-R>=fnamemodify(expand("%:p:h"), ":~:.") . "/" <CR>
nnoremap <Leader>f :e <C-R>=fnamemodify(getcwd(), ":~:.") . "/" <CR>

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
