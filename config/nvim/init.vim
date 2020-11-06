let s:init = stdpath('config') . '/init.vim' " ~/.config/nvim/init.vim
let s:plug = stdpath('config') . '/plug.vim' " ~/.config/nvim/plug.vim
let s:plugdir = stdpath('data') . '/plugged' " ~/.local/share/nvim/plugged

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
Plug 'keith/swift.vim'
Plug 'kshenoy/vim-signature'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
Plug 'nanotech/jellybeans.vim', { 'as': 'jellybeans' }
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'overcache/NeoSolarized'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
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

set termguicolors
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
hi def link typescriptAbstract             Keyword
hi def link typescriptAliasDeclaration     NONE
hi def link typescriptAmbientDeclaration   typescriptImport
hi def link typescriptArrowFuncArg         typescriptFuncArg
hi def link typescriptBinaryOp             Operator
hi def link typescriptCall                 NONE
hi def link typescriptCastKeyword          Keyword
hi def link typescriptClassStatic          Keyword
hi def link typescriptClassTypeParameter   Type
hi def link typescriptConstraint           Type
hi def link typescriptDebugger             Keyword
hi def link typescriptDefault              typescriptImport
hi def link typescriptEnumKeyword          Keyword
hi def link typescriptExport               Include
hi def link typescriptFuncArg              NONE
hi def link typescriptFuncType             NONE
hi def link typescriptImport               Include
hi def link typescriptImportType           typescriptImport
hi def link typescriptInterfaceName        NONE
hi def link typescriptLabel                NONE
hi def link typescriptMappedIn             Type
hi def link typescriptMember               NONE
hi def link typescriptModule               typescriptImport
hi def link typescriptOperator             Keyword
hi def link typescriptReadonlyArrayKeyword Type
hi def link typescriptType                 NONE
hi def link typescriptTypeBracket          Type
hi def link typescriptTypeBrackets         Type
hi def link typescriptTypeParameter        Type
hi def link typescriptTypeQuery            Type
hi def link typescriptTypeReference        Type
hi def link typescriptUserDefinedType      Type

hi def link typescriptProp                NONE

hi def link typescriptArrayMethod               typescriptProp
hi def link typescriptArrayStaticMethod         typescriptProp
hi def link typescriptBOM                       typescriptProp
hi def link typescriptBOMHistoryProp            typescriptProp
hi def link typescriptBOMLocationMethod         typescriptProp
hi def link typescriptBOMNavigatorMethod        typescriptProp
hi def link typescriptBOMNavigatorProp          typescriptProp
hi def link typescriptBOMNetworkProp            typescriptProp
hi def link typescriptBOMWindowMethod           typescriptProp
hi def link typescriptBOMWindowProp             typescriptProp
hi def link typescriptCacheMethod               typescriptProp
hi def link typescriptConsoleMethod             typescriptProp
hi def link typescriptDOMDocMethod              typescriptProp
hi def link typescriptDOMDocProp                typescriptProp
hi def link typescriptDOMEventMethod            typescriptProp
hi def link typescriptDOMEventProp              typescriptProp
hi def link typescriptDOMEventTargetMethod      typescriptProp
hi def link typescriptDOMFormMethod             typescriptProp
hi def link typescriptDOMFormProp               typescriptProp
hi def link typescriptDOMNodeMethod             typescriptProp
hi def link typescriptDOMNodeProp               typescriptProp
hi def link typescriptDOMStorageMethod          typescriptProp
hi def link typescriptDateMethod                typescriptProp
hi def link typescriptDateStaticMethod          typescriptProp
hi def link typescriptDecodingMethod            typescriptProp
hi def link typescriptES6SetMethod              typescriptProp
hi def link typescriptES6SetProp                typescriptProp
hi def link typescriptEncodingMethod            typescriptProp
hi def link typescriptFileListMethod            typescriptProp
hi def link typescriptFileReaderMethod          typescriptProp
hi def link typescriptFileReaderProp            typescriptProp
hi def link typescriptFunctionMethod            typescriptProp
hi def link typescriptGeolocationMethod         typescriptProp
hi def link typescriptHeadersMethod             typescriptProp
hi def link typescriptJSONStaticMethod          typescriptProp
hi def link typescriptMathStaticMethod          typescriptProp
hi def link typescriptNumberMethod              typescriptProp
hi def link typescriptNumberStaticMethod        typescriptProp
hi def link typescriptObjectMethod              typescriptProp
hi def link typescriptObjectStaticMethod        typescriptProp
hi def link typescriptPaymentProp               typescriptProp
hi def link typescriptPaymentResponseMethod     typescriptProp
hi def link typescriptPaymentResponseProp       typescriptProp
hi def link typescriptPaymentShippingOptionProp typescriptProp
hi def link typescriptPromiseMethod             typescriptProp
hi def link typescriptPromiseStaticMethod       typescriptProp
hi def link typescriptRegExpMethod              typescriptProp
hi def link typescriptRegExpProp                typescriptProp
hi def link typescriptRequestMethod             typescriptProp
hi def link typescriptRequestProp               typescriptProp
hi def link typescriptResponseMethod            typescriptProp
hi def link typescriptResponseProp              typescriptProp
hi def link typescriptServiceWorkerMethod       typescriptProp
hi def link typescriptServiceWorkerProp         typescriptProp
hi def link typescriptStringMethod              typescriptProp
hi def link typescriptURLStaticMethod           typescriptProp
hi def link typescriptURLUtilsProp              typescriptProp
hi def link typescriptXHRProp                   typescriptProp

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

command! SynStack echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
