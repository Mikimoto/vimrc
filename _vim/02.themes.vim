" =============================================================================
"  Author:  Mikimoto / mikimoto (at) deepthought.com.tw
"  Blog:  https://mikimoto.github.io
"  Filename:	02.themes.vim
"  Last Modified:	2022-11-17 23:19
"  Description: Custon the themes like Cursor, GUI and title.
"  Reference: https://github.com/mikimoto/vimrc/blob/master/_vim/02.themes.vim
" =============================================================================

" Color Scheme
" -------------
set termguicolors
let base16colorspace=256

" colorscheme base16-tomorrow-night-eighties
" colorscheme base16-dracula
try
    colorscheme base16-harmonic-dark
catch /^Vim\%((\a\+)\)\=:E185/
    " deal with it
endtry


" Cursor
" ------
set cursorline		  "highlight line.
set cursorcolumn	  "highlight column.
set nocompatible	  "do not backward compatible.

" Line Number
" -----------
set number

" Font
" ----
if has('win32')
  set guifont=Consolas:h14
elseif has('gui_macvim')
  "set guifont=Monaco:h14
  set guifont=MesloLGM\ Nerd\ Font\ Mono:h14
else
  " set guifont=Monospace\ 14
  "set guifont=Source\ Code\ Pro\ 14
  set guifont=MesloLGM\ Nerd\ Font\ Mono\ 14
endif

" GUI
" ---

if has('gui')
  set t_Co=256		  " support 256 color.

  set guioptions-=m	" remove Menu.
  set guioptions-=e	" remove Tab-Page.
  set guioptions-=T	" remove Toolbar.
  set guioptions-=b	" remove Scroll (Below).
  set guioptions-=l " remove Scroll (Left of Split window).
  set guioptions-=L " remove Scroll (Left).
  set guioptions-=r " remove Scroll (Right of Split window).
  set guioptions-=R " remove Scroll (Right).

  " disable the Chinese IM when I leaving the insert mode.
  autocmd InsertEnter * set noimdisable
  autocmd InsertLeave * set imdisable

  " changfe the default window size. (width x high)
  "set columns=80 lines=38 "
endif

" Tab
" ---

" always show the tab bar.
"set showtabline=2

" show tab number.
set tabline=%!MyTabLine()
function! MyTabLine()
  let s = '' " complete tabline goes here
  " loop through each tab page
  for t in range(tabpagenr('$'))
    " select the highlighting for the buffer names
    if t + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    " empty space
    let s .= ' '
    " set the tab page number (for mouse clicks)
    let s .= '%' . (t + 1) . 'T'
    " set page number string
    let s .= t + 1 . '. '
    " get buffer names and statuses
    let n = ''  "temp string for buffer names while we loop and check buftype
    let m = 0 " &modified counter
    let bc = len(tabpagebuflist(t + 1))  "counter to avoid last ' '
    " loop through each buffer in a tab
    for b in tabpagebuflist(t + 1)
      " buffer types: quickfix gets a [Q], help gets [H]{base fname}
      " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
      if getbufvar( b, "&buftype" ) == 'help'
        let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
      elseif getbufvar( b, "&buftype" ) == 'quickfix'
        let n .= '[Q]'
      else
        let n .= pathshorten(bufname(b))
        "let n .= bufname(b)
      endif
      " check and ++ tab's &modified count
      if getbufvar( b, "&modified" )
        let m += 1
      endif
      " no final ' ' added...formatting looks better done later
      if bc > 1
        let n .= ' '
      endif
      let bc -= 1
    endfor
    " add modified label [n+] where n pages in tab are modified
    if m > 0
      "let s .= '[' . m . '+]'
      let s.= '+ '
    endif
    " add buffer names
    if n == ''
      let s .= '[No Name]'
    else
      let s .= n
    endif
    " switch to no underlining and add final space to buffer list
    "let s .= '%#TabLineSel#' . ' '
    let s .= ' '
  endfor
  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'
  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999XX'
  endif
  return s
endfunction

" 80 Column
" ---------

" set columns=80

" if exists('+colorcolumn')
"   hi ColorColumn ctermbg=232 guibg=#2d2d2d guifg=white
  "set colorcolumn=80
  "let &colorcolumn="80,".join(range(120,999),",")
" else
"   au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
" endif

function! HightLightOverLength()
  hi OverLength	ctermfg=white	ctermbg=darkred	guifg=white    guibg=#cc0000
    match OverLength /\%>80v.\+/
endfunction
