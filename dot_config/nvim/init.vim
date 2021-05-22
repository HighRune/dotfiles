call plug#begin()

Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

" LSP
" Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-lua/completion-nvim'

" COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Style
Plug 'ts-26a/vim-darkspace'
Plug 'itchyny/lightline.vim'
Plug 'norcalli/nvim-colorizer.lua'
" Plug 'mengelbrecht/lightline-bufferline'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

" Text formating
Plug 'tommcdo/vim-lion'
Plug 'tpope/vim-surround'
" Plug 'tpope/vim-commentary'

" Syntax highlighting
Plug 'storyn26383/vim-vue'
" Plug 'plasticboy/vim-markdown'
" Plug 'godlygeek/tabular'

" Search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" firenvim
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

call plug#end()

" set colorcolumn=80                            " Display a ruler
" set directory=$HOME/.config/nvim/swapfiles//  " Directory for swap files
" set lazyredraw                                " The screen will not be redrawn while executing macros, registers and other commands that have not been typed
" set formatoptions-=cro                        " Stop newline continution of comments



" CONFIG ______________________________________________________


" ____ GENERAL

" set scroll=5
set mouse=a                                   " Enables mouse support
set scrolloff=999                              " Minimal number of screen lines to keep above and below the cursor
set nofoldenable                              " All folds are open
set virtualedit=all
set completeopt=menuone,noinsert              " Options for Insert mode completion
set clipboard+=unnamedplus                    " Have the clipboard be the same as my regular clipboard
set updatetime=100                            " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience
set hidden                                    " Buffer becomes hidden when it is abandoned
autocmd BufEnter * :syntax sync fromstart     " Fix syntax color
autocmd BufEnter *.vue,*.js,*.ts,*.md :set scroll =4

" ____ UI

set termguicolors  " Enables 24-bit RGB color in the Terminal UI
colorscheme darkspace
" autocmd ColorScheme * highlight Normal ctermbg=None
" autocmd ColorScheme * highlight NonText ctermbg=None
" autocmd ColorScheme * highlight Normal guibg=None
" autocmd ColorScheme * highlight NonText guibg=None
set noshowmode     " Disable message on the last line (Insert, Replace or Visual mode)
" set showtabline=2  " Always display the line with tab page labels

" ____ SEARCH

set ignorecase " Ignore case in search patterns
set smartcase  " Override the 'ignorecase' option if the search pattern contains upper case characters

" ____ INDENTATION

set expandtab                   " Use the appropriate number of spaces to insert a <Tab>
set smartindent                 " Do smart autoindenting when starting a new line
set copyindent                  " Copy the structure of the existing lines indent when autoindenting a new line
set softtabstop=2               " Number of spaces that a <Tab> counts for while performing editing operations, like inserting a <Tab> or using <BS>
set tabstop=2                   " Number of spaces that a <Tab> in the file counts for
set shiftwidth=2                " Number of spaces to use for each step of (auto)indent

" ____ LINES

set number         " Print the line number in front of each line
" set relativenumber " Show the line number relative to the line with the cursor in front of each line
" :augroup numbertoggle
" :  autocmd!
" :  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
" :  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" :augroup END



" PLUGINS ______________________________________________________


" ____ COLORIZER

lua require'colorizer'.setup()

" ____ COC

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=200

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" ____ LSP

" let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
" let g:completion_matching_ignore_case = 1
" 
" " Enable file logging
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/vim-lsp.log')
" let g:asyncomplete_log_file = expand('~/asyncomplete.log')
" 
" :lua << END
" require'lspconfig'.vuels.setup{}
" require'lspconfig'.tsserver.setup{}
" END
" 
" lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }
" lua require'lspconfig'.vuels.setup{ on_attach=require'completion'.on_attach }
" 
" " Use <Tab> and <S-Tab> to navigate through popup menu
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" 
" lua <<EOF
" require'lspconfig'.diagnosticls.setup{
"   filetypes={'javascript'},
"   init_options = {
"     linters = {
"       eslint = {
"         command = './node_modules/.bin/eslint',
"         rootPatterns = {'.git'},
"         debounce = 100,
"         args = {
"           '--stdin',
"           '--stdin-filename',
"           '%filepath',
"           '--format',
"           'json'
"         },
"         sourceName = 'eslint',
"         parseJson = {
"           errorsRoot = '[0].messages',
"           line = 'line',
"           column = 'column',
"           endLine = 'endLine',
"           endColumn = 'endColumn',
"           message = '${message} [${ruleId}]',
"           security = 'severity'
"         },
"         securities = {
"           [2] = 'error',
"           [1] = 'warning',
"         },
"       },
"     },
"     filetypes = {
"       javascript = 'eslint'
"     },
"     formatters = {
"       prettier = {
"         command = "./node_modules/.bin/prettier",
"         args = {"--stdin-filepath" ,"%filepath", '--single-quote', '--print-width 120'}
"       }
"     },
"     formatFiletypes = {
"       javascript = "prettier"
"     },
"   }
" }
" EOF

" ____ TREESITTER

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  }
}
EOF

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" ____ FZF

" Hide statusline when fzf start in a terminal buffer
autocmd! FileType fzf set laststatus=0 noruler
  \| autocmd BufLeave <buffer> set laststatus=2 ruler

" ____ LIGHTLINE

let g:lightline                         = {}
let g:lightline.colorscheme             = 'darkspace'
let g:lightline.active                  = {
\ 'left': [['mode', 'paste'], ['readonly']],
\ 'right': [[ 'percent' ], [ 'fileformat', 'fileencoding' ]]
\ }

" ____ BUFFERLINE

" let g:lightline.tabline                 = {'left': [['buffers']], 'right': [['close']]}
" let g:lightline.component_expand        = {'buffers': 'lightline#bufferline#buffers'}
" let g:lightline.component_type          = {'buffers': 'tabsel'}
" let g:lightline#bufferline#unnamed      = '?'

let bufferline = {}
let bufferline.closable = v:false
let bufferline.animation = v:false
let bufferline.maximum_padding = 0



" MAPPING ______________________________________________________


let mapleader = "\<Space>"
:tnoremap <Esc> <C-\><C-n>  " Terminal, visual mode

" nnoremap <Tab> :echom "Tab"<cr>
" nnoremap <C-Tab> :echom "C-Tab"<cr>
" nnoremap <S-Tab> :echom "S-Tab"<cr>
" nnoremap <C-S-Tab> :echom "C-S-Tab"<cr>
" nnoremap <C-h> :echom "C-h"<cr>
" nnoremap <C> :echom "C"<cr>

map <C-k> :BufferNext<CR>
map <C-j> :BufferPrevious<CR>
map <C-h> :BufferClose<CR>

nnoremap <silent>    <A-a> :BufferGoto 1<CR>
nnoremap <silent>    <A-o> :BufferGoto 2<CR>
nnoremap <silent>    <A-e> :BufferGoto 3<CR>
nnoremap <silent>    <A-u> :BufferGoto 4<CR>
nnoremap <silent>    <A-;> :BufferGoto 5<CR>
nnoremap <silent>    <A-q> :BufferGoto 6<CR>
nnoremap <silent>    <A-j> :BufferGoto 7<CR>
nnoremap <silent>    <A-k> :BufferGoto 8<CR>
nnoremap <silent>    <A-i> :BufferLast<CR>

" map <C-k> :bn<CR>
" map <C-j> :bp<CR>
" Switch to the next buffer then wipe the previous one
" map <C-h> :bn<Bar>:bw!#<CR>

map <M-j> 4j
map <M-k> 4k

" ____ FZF

nnoremap <Leader>f :Files<CR>
nnoremap <Leader>l :Lines<CR>
nnoremap <Leader>s :Ag<CR>
nnoremap <Leader>bb :Buffers<CR>
nnoremap <Leader>bc :BCommits<CR>
nnoremap <Leader>bl :BLines<CR>
nnoremap <Leader>gc :Commits<CR>
nnoremap <Leader>gf :GFiles<CR>

" ____ NERDTREE

nnoremap <Leader>n :NERDTreeToggle<CR>
