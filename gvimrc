" Font
if has("win32") || has("win64")
  set guifont=NasuM:h10:cSHIFTJIS
  set printfont=NasuM:h10:cSHIFTJIS
else
  set guifont=NasuM:h14
  set printfont=NasuM:h14
endif

" Colorscheme
set background=dark
colorscheme gruvbox

" Default window size
set columns=120
set lines=35

" IME settings in Insert/Search Mode for Windows environment
" 0:off 1:off 2:on
if has("win32") || has("win64")
  set iminsert=0
  set imsearch=0
  " Fix IM control mode
  let IM_CtrlMode = 4
endif
