"---------------------------------------
" Bundle(NeoBundle) configuration
"---------------------------------------
set nocompatible
filetype plugin indent off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#rc(expand('~/.vim/bundle/'))
endif

" List Bundle plugins here
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'DirDiff.vim'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'google.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'nanotech/jellybeans.vim'


filetype plugin indent on
syntax on

"---------------------------------------
" ColorScheme
"---------------------------------------
set background=dark
if has('gui')
    colorscheme hybrid
else
    colorscheme jellybeans
endif

"---------------------------------------
" Run as VIM (no-compatible)
"---------------------------------------
set nocompatible

"---------------------------------------
" Display configuration
"---------------------------------------
set number
set cursorline
set wrap
set list
set listchars=tab:>-,trail:-

set laststatus=2
set cmdheight=2
set showcmd

"---------------------------------------
" Mouse configuration
"---------------------------------------
set mouse=a

"---------------------------------------
" Editor configuration
"---------------------------------------
" No backup, no swap file
set nobackup
set noswapfile
" enable to open other file in edit
set hidden
" wildmode(complement)
set wildmenu
set wildmode=list:longest
" no beep
set vb t_vb=

" Tab behavior
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" enable to delete newline
set backspace=2

" Copy&Paste
set clipboard=unnamed

" Search behavior
set ignorecase
set smartcase

" change current directory when changing buffer
au BufEnter * execute ":lcd " . expand("%:p:h")

" enable VimFiler as default explorer
let g:vimfiler_as_default_explorer = 1

"---------------------------------------
" Keyboard Remap
"---------------------------------------

" Editor
nnoremap Y y$
" Unite
nnoremap <F3> <ESC><ESC>:Unite buffer<CR>
noremap :ub :Unite buffer
" VimFiler
nnoremap <Leader>e :VimFilerExplorer<CR>
