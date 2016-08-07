" Be improved
set nocompatible
filetype plugin indent on
syntax enable

" vim-plug
let g:plugged_dir = has("win32") || has("win64") ? '~/vimfiles/plugged/' : '~/.vim/plugged/'
call plug#begin(expand(g:plugged_dir))
if has("lua") && has ("patch-7.4.954")
  Plug 'Shougo/neocomplete.vim'
else
  Plug 'Shougo/neocomplecache.vim'
endif
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'will133/vim-dirdiff'
Plug 'google.vim'
Plug 'kien/ctrlp.vim'
Plug 'ludovicchabant/vim-lawrencium'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'milkypostman/vim-togglelist'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'ntpeters/vim-better-whitespace'
Plug 'gasuketsu/gtags.vim'
" Color Schemes
Plug 'w0ng/vim-hybrid'
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
call plug#end()

let s:plug = {
      \ "plugs": get(g:, 'plugs', {})
      \ }

function! s:plug.is_installed(name)
  return has_key(self.plugs, a:name) ? isdirectory(self.plugs[a:name].dir) : 0
endfunction

" Color Scheme
set t_Co=256
let g:solarized_italic=0
let g:solarized_termcolors=256
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_contrast_light='medium'
let g:gruvbox_invert_selection=0
set background=dark
colorscheme gruvbox

" Buffers and Tab Mode
let g:airline#extensions#tabline#enabled = 1

"---------------------------------------
" Display configuration
"---------------------------------------
set shellslash
set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,cp932,iso-2022-jp

set number
set cursorline
set wrap
set list
set listchars=tab:>-,trail:.,extends:<,precedes:>
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
set wildignore+=*.o,*.obj,*.a,*.pyc,*.DS_Store,*.db,*/tmp/*,*.swp,*.zip,*.exe,*.dll,*.so
if has("win32") || has("win64")
  set wildignore+=NTUSER*,ntuser*
endif

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
set tags+=tags;~/

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

nnoremap <silent> <C-tab> :<C-u>bn<CR>
nnoremap <silent> <C-S-tab> :<C-u>bp<CR>
nnoremap <silent> <F7> :<C-u>tabnext<CR>
nnoremap <silent> <F8> :<C-u>tabprevious<CR>

" change current directory when changing buffer
"set autochdir
nnoremap <silent> <F3> :<C-u>lcd %:h<CR>

"------------------------------------
" NERDTree
"------------------------------------
nmap <silent> <F9> :<C-u>NERDTreeToggle<CR>

"------------------------------------
" ctrlp.vim
"------------------------------------
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_root_markers = ['.ctrlp']
let g:ctrlp_open_new_file = 'r'

" VCS command
nmap <Leader>v [VCS]
let g:VCSCommandMapPrefix = '[VCS]'

"---------------------
" FileType settings
"---------------------
" Markdown
autocmd BufWinEnter *.{md,mkd,mkdn,markdown} silent setf markdown

"---------------------------
" vim-better-whitespace
"---------------------------
" disable highlighting trailing whitespace by default.
" (perform :ToggleWhitespace to enable highlighting)
let g:better_whitespace_enabled = 0
nnoremap <silent> <leader>w :ToggleWhitespace<CR>
vnoremap <silent> <F12> :StripWhitespace<CR>
nnoremap <silent> <F12> :StripWhitespace<CR>

"--------------------------
" multiple cursors
"--------------------------
let g:multiple_cursor_use_default_mapping=0
let g:multiple_cursor_next_key='<C-n>'
let g:multiple_cursor_prev_key='<C-h>'
let g:multiple_cursor_skip_key='<C-x>'
let g:multiple_cursor_quit_key='<Esc>'

"--------------------------
" neocomplete
"--------------------------
if s:plug.is_installed('neocomplete.vim')
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_ignore_case = 0
  let g:neocomplete#enable_smart_case  = 1
  let g:neocomplete#enable_fuzzy_completion = 0
  let g:neocomplete#min_keyword_length = 3
  if !exists('g:neocomplete#sources#dictionary#dictionaries')
    let g:neocomplete#sources#dictionary#dictionaries = {}
  endif
  let dict = g:neocomplete#sources#dictionary#dictionaries

  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns._ = '\h\w*'
  let g:neocomplete#sources#buffer#disabled_pattern = '\.log\|\.log\.\|\.jax\|\.txt\|\.bak\|\.orig'

  call neocomplete#custom_source('_', 'sorters',  ['sorter_length'])
  call neocomplete#custom_source('_', 'matchers', ['matcher_head'])

  inoremap <expr><CR>   pumvisible() ? neocomplete#close_popup() : "<CR>"
  inoremap <expr><Esc>  pumvisible() ? neocomplete#close_popup() : "<Esc>"
  inoremap <expr><C-c>  pumvisible() ? neocomplete#cancel_popup() : neocomplete#start_manual_complete()
  inoremap <expr><C-u>  pumvisible() ? neocomplete#undo_completion() : "\<C-u>"
  inoremap <expr><C-h>  pumvisible() ? neocomplete#smart_close_popup()."\<C-h>" : "\<C-h>"
elseif s:plug.is_installed('neocomplcache.vim')
  let g:neocomplcache_enable_at_startup = 1
  let g:neocomplcache_enable_ignore_case = 0
  let g:neocomplcache_enable_smart_case  = 0
  if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
  endif
  let g:neocomplcache_keyword_patterns._ = '\h\w*'
  let g:neocomplcache_enable_camel_case_completion = 1
  let g:neocomplcache_enable_underbar_completion = 1
endif
