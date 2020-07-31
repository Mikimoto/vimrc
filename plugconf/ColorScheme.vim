" ------ Terminal Setting ------
let no_buffers_menu=1
silent! colorscheme molokai

set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

if $COLORTERM == 'gnome-terminal'
  set term=gnome-256color
else
  if $TERM == 'xterm'
    set term=xterm-256color
  endif
endif

" GUI settings
set termguicolors  " need +termguicolors
" termguicolors sometimes cause problem
if has('gui_running')
  colorscheme nord
else
  "let g:gruvbox_contrast_dark = 'medium'
  let g:gruvbox_improved_warnings = 1
  set background=dark
  colorscheme gruvbox
  let g:airline_theme = 'gruvbox'
endif


