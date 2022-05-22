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
Plug 'github/copilot.vim'
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

autocmd BufNewFile,BufRead *.mdx set filetype=markdown

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
let g:clap_enable_background_shadow = v:false

autocmd User ClapOnEnter call g:clap.display.setbufvar('&relativenumber', 0)

let g:tmuxline_preset = 'nightly_fox'
let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '>',
    \ 'right' : '',
    \ 'right_alt' : '<',
    \ 'space' : ' '}

" yats.vim

hi def link typescriptAbstract                  Keyword
hi def link typescriptAliasDeclaration          NONE
hi def link typescriptAmbientDeclaration        typescriptImport
hi def link typescriptArrayMethod               NONE
hi def link typescriptArrayStaticMethod         NONE
hi def link typescriptArrowFuncArg              typescriptFuncArg
hi def link typescriptBOM                       NONE
hi def link typescriptBOMHistoryProp            NONE
hi def link typescriptBOMLocationMethod         NONE
hi def link typescriptBOMNavigatorMethod        NONE
hi def link typescriptBOMNavigatorProp          NONE
hi def link typescriptBOMNetworkProp            NONE
hi def link typescriptBOMWindowMethod           NONE
hi def link typescriptBOMWindowProp             NONE
hi def link typescriptBinaryOp                  Operator
hi def link typescriptCacheMethod               NONE
hi def link typescriptCall                      NONE
hi def link typescriptCastKeyword               Keyword
hi def link typescriptClassStatic               Keyword
hi def link typescriptClassTypeParameter        Type
hi def link typescriptConsoleMethod             NONE
hi def link typescriptConstraint                Type
hi def link typescriptDOMDocMethod              NONE
hi def link typescriptDOMDocProp                NONE
hi def link typescriptDOMEventMethod            NONE
hi def link typescriptDOMEventProp              NONE
hi def link typescriptDOMEventTargetMethod      NONE
hi def link typescriptDOMFormMethod             NONE
hi def link typescriptDOMFormProp               NONE
hi def link typescriptDOMNodeMethod             NONE
hi def link typescriptDOMNodeProp               NONE
hi def link typescriptDOMStorageMethod          NONE
hi def link typescriptDateMethod                NONE
hi def link typescriptDateStaticMethod          NONE
hi def link typescriptDebugger                  Keyword
hi def link typescriptDecodingMethod            NONE
hi def link typescriptDefault                   typescriptImport
hi def link typescriptES6SetMethod              NONE
hi def link typescriptES6SetProp                NONE
hi def link typescriptEncodingMethod            NONE
hi def link typescriptEnumKeyword               Keyword
hi def link typescriptExport                    Include
hi def link typescriptFileListMethod            NONE
hi def link typescriptFileReaderMethod          NONE
hi def link typescriptFileReaderProp            NONE
hi def link typescriptFuncArg                   NONE
hi def link typescriptFuncType                  NONE
hi def link typescriptFunctionMethod            NONE
hi def link typescriptGeolocationMethod         NONE
hi def link typescriptGlobalMethod              NONE
hi def link typescriptHeadersMethod             NONE
hi def link typescriptImport                    Include
hi def link typescriptImportType                typescriptImport
hi def link typescriptInterfaceName             NONE
hi def link typescriptJSONStaticMethod          NONE
hi def link typescriptLabel                     NONE
hi def link typescriptMappedIn                  Type
hi def link typescriptMathStaticMethod          NONE
hi def link typescriptMember                    NONE
hi def link typescriptModule                    typescriptImport
hi def link typescriptNumberMethod              NONE
hi def link typescriptNumberStaticMethod        NONE
hi def link typescriptObjectMethod              NONE
hi def link typescriptObjectStaticMethod        NONE
hi def link typescriptOperator                  Keyword
hi def link typescriptParamImpl                 typescriptString
hi def link typescriptPaymentProp               NONE
hi def link typescriptPaymentResponseMethod     NONE
hi def link typescriptPaymentResponseProp       NONE
hi def link typescriptPaymentShippingOptionProp NONE
hi def link typescriptPromiseMethod             NONE
hi def link typescriptPromiseStaticMethod       NONE
hi def link typescriptProp                      NONE
hi def link typescriptReadonlyArrayKeyword      Type
hi def link typescriptRegExpMethod              NONE
hi def link typescriptRegExpProp                NONE
hi def link typescriptRequestMethod             NONE
hi def link typescriptRequestProp               NONE
hi def link typescriptResponseMethod            NONE
hi def link typescriptResponseProp              NONE
hi def link typescriptServiceWorkerMethod       NONE
hi def link typescriptServiceWorkerProp         NONE
hi def link typescriptStringMethod              NONE
hi def link typescriptType                      NONE
hi def link typescriptTypeBracket               Type
hi def link typescriptTypeBrackets              Type
hi def link typescriptTypeParameter             Type
hi def link typescriptTypeQuery                 Type
hi def link typescriptTypeReference             Type
hi def link typescriptURLStaticMethod           NONE
hi def link typescriptURLUtilsProp              NONE
hi def link typescriptUserDefinedType           Type
hi def link typescriptXHRProp                   NONE

" KEY MAPPINGS

let mapleader="\<Space>"

inoremap jk <Esc>

map Q <Nop>
map qq <Nop>

nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

vnoremap < <gv
vnoremap > >gv

command! SynStack echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')

" vim-clap

nnoremap <Leader>p :Clap files<cr>
nnoremap <Leader>b :Clap buffers<cr>
nnoremap <Leader>y :Clap yanks<cr>
nnoremap <Leader>/ :Clap grep<cr>
nnoremap <Leader>e :e <C-R>=fnamemodify(expand("%:p:h"), ":~:.") . "/" <CR>
nnoremap <Leader>f :e <C-R>=fnamemodify(getcwd(), ":~:.") . "/" <CR>

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

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

" vim-prettier

nmap <leader>t :Prettier<cr>

" copilot.vim

imap <C-j> <Plug>(copilot-previous)
imap <C-k> <Plug>(copilot-next)
