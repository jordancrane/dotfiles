" vim-plug {{{
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes

" File manager
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Fast selection of blocks with <CR>
Plug 'gcmt/wildfire.vim'

" Navigate between tmux panes and vim splits seamlessly
Plug 'christoomey/vim-tmux-navigator'

" Awesome status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Autocomplete
Plug 'Shougo/deoplete.nvim' ", { 'do': ':UpdateRemotePlugins' }
"Plug 'zchee/deoplete-clang'
"Plug 'Shougo/neoinclude.vim'
 
" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" git integrations
Plug 'tpope/vim-fugitive'

" parens & quotes editing
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

" Syntax checker
Plug 'w0rp/ale'

" Fast vim motions
Plug 'easymotion/vim-easymotion'

" Fast pattern search
Plug 'mileszs/ack.vim'

" Fuzzy Search & tabs
" Plug 'vim-ctrlspace/vim-ctrlspace'

" {{{ Syntax Highlighters
" rust highlighting
Plug 'rust-lang/rust.vim'

" JavaScript Highlighting
Plug 'pangloss/vim-javascript'

" JSX Highlighting
Plug 'mxw/vim-jsx'

" }}}

" {{{ Color Schemes
" Seoul color scheme
Plug 'junegunn/seoul256.vim'

" Nord color scheme
Plug 'arcticicestudio/nord-vim'

" Apprentice color scheme
Plug 'romainl/Apprentice'

" }}}

" Initialize plugin system
call plug#end()
" }}}

" Appearance {{{
" colorscheme
set nohlsearch
let base16colorspace=256
colorscheme apprentice
" colorscheme nord
" }}}

" Bindings {{{
nnoremap <Space> <Nop>
let mapleader = " "

inoremap jk <ESC>

" Quickly edit and source vimrc
nnoremap <leader>ec :vsplit ~/.config/nvim/init.vim<cr>
noremap <leader>rc :source ~/.config/nvim/init.vim<cr>
" }}}

" Buffers {{{
" Airline show list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nnoremap <C-c> <Nop>
nnoremap <C-c> :enew<CR>

" Move to the next buffer
nnoremap <C-n> <Nop>
nnoremap <C-n> :bnext<CR>

" Move to the previous buffer
nnoremap <C-p> <Nop>
nnoremap <C-p> :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nnoremap <C-x> <Nop>
nnoremap <C-x> :bp <BAR> bw #<CR>

" Show all open buffers and their status
nnoremap <leader>bl :ls<CR>
" }}}

" ack.vim {{{
let g:ackprg = 'ag --vimgrep'
" }}} ack.vim "

" Ctrl-Space {{{
"nnoremap <silent><C-Space> :CtrlSpace O<CR>

set nocompatible
set hidden
" }}}

" Deoplete {{{
let g:deoplete#enable_at_startup = 1
" }}}

" Auto-pairs {{{
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<M-b>'
" }}} Auto-pairs

" Ultisnips {{{
inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
let g:UltiSnipsExpandTrigger="<C-CR>"
" }}}

" Folding {{{
set foldenable
set foldlevelstart=10
set foldnestmax=10

" leader a opens/closes fold
nnoremap <leader>a za

" fold based on indent level
set foldmethod=indent
"  }}}

" Indentation {{{
set tabstop    =2
set softtabstop=2
set shiftwidth =2
set expandtab
set autoindent
set smartindent
filetype indent on
" }}}

" Movement {{{
" move up and down by visual line
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
" move to beg/end of line
nnoremap B ^
nnoremap E $
"nnoremap ^ <nop>
"nnoremap $ <nop>
" }}}

" NerdTree {{{
map <F9> :NERDTreeToggle<CR>
" }}}

" Splits {{{
" navigate vim splits like a sane person
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" more intuitive split opening
set splitbelow
set splitright
"  }}}

" UI Settings {{{
set number
set cursorline
set breakindent
set showmatch
set hls
syntax on

" Yank/put text via system clipboard
noremap <leader>y "+y
noremap <leader>yy "+Y
noremap <leader>p "+p

"  }}}

" Modeline {{{
set modeline
set modelines=1
" }}}

" vim:foldmethod=marker:foldlevel=0
