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
Plug 'editorconfig/editorconfig-vim'
Plug 'edkolev/tmuxline.vim'
Plug 'github/copilot.vim'
Plug 'keith/swift.vim'
Plug 'kshenoy/vim-signature'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nanotech/jellybeans.vim', { 'as': 'jellybeans' }
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'overcache/NeoSolarized'
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
set mouse=
set nobackup
set nojoinspaces
set noswapfile
set nowb
set nowrap
set nowritebackup
set shiftwidth=2
set softtabstop=2
set tabstop=2
set termguicolors

command! W w
command! Q q

" APPEARANCE

" Soften the color scheme's diff colors: blend each toward the Normal background
" and drop the text color, so syntax colors show through in diffs.

" Mix two 0xRRGGBB colors; amount 0.0 gives base, 1.0 gives color
function! s:Blend(color, base, amount) abort
  let channels = map([0x10000, 0x100, 0x1], {_, unit ->
        \ float2nr(round((a:base / unit % 0x100) + ((a:color / unit % 0x100) - (a:base / unit % 0x100)) * a:amount))})
  return call('printf', ['#%02x%02x%02x'] + channels)
endfunction

" The color a group actually paints behind text (its fg when reversed), or -1
function! s:BackgroundOf(group) abort
  let hl = nvim_get_hl(0, {'name': a:group, 'link': v:false})
  return get(hl, get(hl, 'reverse', v:false) ? 'fg' : 'bg', -1)
endfunction

function! s:SoftenDiffColors() abort
  let base = s:BackgroundOf('Normal')
  if base < 0
    return
  endif
  let delete = s:BackgroundOf('DiffDelete')
  for [group, amount] in [['DiffAdd', 0.45], ['DiffChange', 0.45], ['DiffText', 0.30], ['DiffDelete', 0.35]]
    let color = s:BackgroundOf(group)
    if color >= 0
      exe 'hi' group 'guifg=NONE gui=NONE guibg=' . s:Blend(color, base, amount)
    endif
  endfor
  " Filler lines in the other pane are drawn with DiffDelete's fg
  if delete >= 0
    exe 'hi DiffDelete guifg=' . s:Blend(delete, base, 0.60)
  endif
endfunction

augroup soften_diff_colors
  autocmd!
  autocmd ColorScheme * call s:SoftenDiffColors()
augroup END

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
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
set updatetime=300

autocmd BufNewFile,BufRead *.mdx set filetype=markdown
autocmd FileType markdown,text,mail setlocal wrap

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
hi def link typescriptFuncCallArg               NONE
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
hi def link typescriptTestGlobal                NONE
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
inoremap jc console.log()<Esc>i


map Q <Nop>
map qq <Nop>

nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

vnoremap < <gv
vnoremap > >gv

command! SynStack echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')

" Telescope

nnoremap <Leader>p <cmd>Telescope git_files<cr>
nnoremap <Leader>b <cmd>Telescope buffers<cr>
nnoremap <Leader>/ <cmd>Telescope live_grep<cr>

lua require('config.telescope')

" File helpers

nnoremap <Leader>e :e <C-R>=fnamemodify(expand("%:p:h"), ":~:.") . "/" <CR>
nnoremap <Leader>f :e <C-R>=fnamemodify(getcwd(), ":~:.") . "/" <CR>

" Fugitive

" :Gshow [rev] - open a commit in difftool (one tab per file, parent vs commit)
function! s:GitShowDiff(rev) abort
  let rev = empty(a:rev) ? 'HEAD' : a:rev
  let sha = trim(FugitiveExecute(['rev-parse', '--verify', '--quiet', rev . '^{commit}']).stdout[0])
  if empty(sha)
    echohl ErrorMsg | echo 'Gshow: not a commit: ' . rev | echohl None
    return
  endif
  if empty(trim(FugitiveExecute(['rev-parse', '--verify', '--quiet', sha . '~']).stdout[0]))
    echohl ErrorMsg | echo 'Gshow: ' . sha[0:9] . ' is a root commit' | echohl None
    return
  endif
  " silent hides git's "fatal: path ... not in <parent>" noise for files the commit added
  exe 'silent Git difftool -y ' . sha . '~ ' . sha
endfunction

" First commit hash on the cursor line, falling back to the word under the cursor
function! s:CommitOnLine() abort
  let hash = matchstr(getline('.'), '\<\x\{7,40}\>')
  return empty(hash) ? expand('<cword>') : hash
endfunction

command! -nargs=? -complete=customlist,fugitive#EditComplete Gshow call s:GitShowDiff(<q-args>)

" :Gd [args] - unstaged changes in difftool, like `git diff`
command! -nargs=* -complete=customlist,fugitive#EditComplete Gd exe 'silent Git difftool -y ' . <q-args>

" :Gdc [args] - staged changes in difftool, like `git diff --cached`
" (Fugitive only recognizes --cached here; --staged silently diffs index vs work tree)
command! -nargs=* -complete=customlist,fugitive#EditComplete Gdc exe 'silent Git difftool -y --cached ' . <q-args>

augroup gshow
  autocmd!
  " In :Git log and :Git blame buffers, <Leader>d opens the commit on the cursor line
  autocmd FileType git,fugitiveblame nnoremap <buffer> <silent> <Leader>d :call <SID>GitShowDiff(<SID>CommitOnLine())<CR>
augroup END

" coc.nvim

let g:coc_global_extensions = ['coc-tsserver', 'coc-eslint', 'coc-prettier', 'coc-oxc', 'coc-json']

" coc-oxc only activates in projects with a local oxfmt, so prettier still formats elsewhere
let g:coc_user_config = { 'oxc.oxfmt.formatterPriority': 2 }

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <c-space> coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

command! -bar -nargs=0 ESLint :CocCommand eslint.executeAutofix
command! -bar -nargs=0 Format :call CocAction('format')

nnoremap <silent> K :call ShowDocumentation()<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

nmap <leader>t :Format <bar> :ESLint<cr>

" copilot.vim

imap <C-j> <Plug>(copilot-previous)
imap <C-k> <Plug>(copilot-next)
