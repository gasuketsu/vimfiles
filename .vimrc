" Be improved
set nocompatible

if has("win32") || has("win64")
  set runtimepath^=~/.vim
  set runtimepath+=~/.vim/after
endif

"---------------------------------------
" Bundle(NeoBundle) configuration
"---------------------------------------
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#begin(expand('~/.vim/bundle/'))

let g:neobundle_default_git_protocol='https'
" List Bundle plugins here
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'QuickBuf'
NeoBundle 'DirDiff.vim'
NeoBundle 'google.vim'
NeoBundle 'gtags.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'ludovicchabant/vim-lawrencium'
NeoBundle 'vcscommand.vim'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'bling/vim-airline'
NeoBundle 'milkypostman/vim-togglelist'
" Color Schemes
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'wombat256.vim'
NeoBundle 'tomasr/molokai'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'morhetz/gruvbox'

call neobundle#end()

syntax enable
filetype on
filetype plugin indent on

"---------------------------------------
" Color Scheme
"---------------------------------------
set t_Co=256
let g:solarized_italic=0
let g:solarized_termcolors=256
"let g:molokai_original = 1
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'
set background=dark
colorscheme gruvbox

"---------------------------------------
" Run as VIM (no-compatible)
"---------------------------------------
set nocompatible
set shellslash
set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,cp932,iso-2022-jp

"---------------------------------------
" Display configuration
"---------------------------------------
set number
set cursorline
set wrap
set list
set listchars=tab:>-,trail:-,extends:<,precedes:>
set ambiwidth=double

set cmdheight=2
set laststatus=2
set showcmd
set display=lastline

"---------------------------------------
" Mouse configuration
"---------------------------------------
set mouse=a

"---------------------------------------
" Editor configuration
"---------------------------------------
" No backup, No swapfile
set nobackup
set noswapfile
set viminfo=
if v:version >= 704
  set noundofile
endif

" enable to open other file in edit
set hidden

" wildmode(complement)
set wildmenu
set wildmode=list:longest
set wildignore+=*.o,*.obj,*.pyc,*.DS_Store,*.db

" no beep
set vb t_vb=

" timeout
" may need to  put these settings into vimfiles/plugin/notimeout.vim
set notimeout
set ttimeout
set timeoutlen=200

" Indentation
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set cindent
set cino=>2,l1,N-s,g0,(0

" enable to delete newline
set backspace=2

" Copy&Paste
set clipboard=unnamed

" Search behavior
set hlsearch
set ignorecase
set smartcase

" change current directory when changing buffer
set autochdir

" IME settings in Insert/Search Mode for Windows environment
" 0:off 1:off 2:on
if has("win32") || has("win64")
    set iminsert=0
    set imsearch=0
  " Fix IM control mode
  let IM_CtrlMode = 4
endif

"---------------------------------------
" Ctags
"---------------------------------------
set tags+=.tags;~/

"---------------------------------------
" Keyboard Remap
"---------------------------------------
" Editor
nnoremap Y y$

" Gtags
nnoremap tg :<C-u>Gtags -g
nnoremap <silent> tf :<C-u>Gtags -f %<CR>
nnoremap <silent> tt :<C-u>Gtags <C-r><C-w><CR>
nnoremap <silent> tr :<C-u>Gtags -r <C-r><C-w><CR>
nnoremap <silent> <C-Q> :<C-u>ccl<CR>
nnoremap <silent> <C-j> :<C-u>cn<CR>
nnoremap <silent> <C-k> :<C-u>cp<CR>

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

"-------------------------------------
" Buffers and Tab Mode
"-------------------------------------
let g:airline#extensions#tabline#enabled = 1
nnoremap <silent> <C-tab> :<C-u>bn<CR>
nnoremap <silent> <C-S-tab> :<C-u>bp<CR>
nmap <leader>t [TABCMD]
nnoremap <silent> [TABCMD]f :<C-u>tabfirst<CR>
nnoremap <silent> [TABCMD]l :<C-u>tablast<CR>
nnoremap [TABCMD]e :<C-u>tabedit
nnoremap <silent> [TABCMD]c :<C-u>tabclose<CR>
nnoremap <silent> [TABCMD]o :<C-u>tabonly<CR>
nnoremap <silent> [TABCMD]s :<C-u>tabs<CR>
nnoremap <silent> [TABCMD]n :<C-u>tabnext<CR>
nnoremap <silent> [TABCMD]p :<C-u>tabprevious<CR>
nnoremap <silent> <F7> :<C-u>tabnext<CR>
nnoremap <silent> <F8> :<C-u>tabprevious<CR>

" set working directory as current directory
set autochdir

"------------------------------------
" NERDTree
"------------------------------------
nmap <silent> <F9> :<C-u>NERDTreeToggle<CR>

"------------------------------------
" ctrlp.vim
"------------------------------------
let g:ctrlp_clear_cache_on_exit = 0
let g:qb_hotkey = "<F3>"

" VCS command
nmap <Leader>v [VCS]
let g:VCSCommandMapPrefix = '[VCS]'

"---------------------
" FileType settings
"---------------------
" Markdown
autocmd BufWinEnter *.{md,mkd,mkdn,markdown} silent setf markdown

"---------------------------
" TrimTrailingWhitespace
"---------------------------
vnoremap <silent> <F12> :s/\s\+$//e<CR>
nnoremap <silent> <F12> :%s/\s\+$//e<CR>

"--------------------------
" caw commenting
"--------------------------
nmap <Leader>c <Plug>(caw:i:toggle)<CR>
vmap <Leader>c <Plug>(caw:i:toggle)<CR>

"--------------------------
" multiple cursors
"--------------------------
let g:multiple_cursor_use_default_mapping=0
let g:multiple_cursor_next_key='<C-n>'
let g:multiple_cursor_prev_key='<C-h>'
let g:multiple_cursor_skip_key='<C-x>'
let g:multiple_cursor_quit_key='<Esc>'

