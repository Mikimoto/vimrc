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


