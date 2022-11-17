" =============================================================================
"  Author: Mikimoto / mikimoto (at) deepthought.com.tw
"  Blog: https://mikimoto.github.io
"  Filename:	05.plugins.vim
"  Last Modified:	2022-11-17 23:19
"  Description: 
"  Reference:
" =============================================================================


" Valloric/YouCompleteMe (code-completion)
" ----------------------------------------
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/simple_ycm_extra_conf.py'
let g:ycm_seed_identifiers_with_syntax = 1
set completeopt=menu

" make YCM compatible with UltiSnips (using <Ctrl-N>, <Ctrl-P>)
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:ycm_use_clangd = 1

" commands mappings
" nnoremap <F1> :pclose<CR>:silent YcmCompleter GetDoc<CR>
" nnoremap <S-F1> :pclose<CR>
" nnoremap <C-F1> :YcmCompleter GetType<CR>
" nnoremap <F9> :YcmCompleter GoTo<CR>
" nnoremap <S-F9> :YcmCompleter GoToReferences<CR>
" nnoremap <F10> :YcmCompleter FixIt<CR>

" Color chart from vim color (http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html)
hi Pmenu ctermfg=0 ctermbg=85 guifg=#000000 guibg=#5fffaf
hi PmenuSel ctermfg=85 ctermbg=163 guifg=#5fffaf guibg=#d700af


" scrooloose/nerdtree
" ----------------------------------------
let NERDTreeShowHidden=1

" Open NERDTree at right window.
" let NERDTreeWinPos=1
" nmap <leader>e :NERDTreeToggle<CR>

function StartUp()
    if ''==@%
        NERDTree
    endif
endfunction
" autocmd VimEnter * call StartUp()


" SirVer/ultisnips
" ----------------------------------------
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"
" let g:UltiSnipsExpandTrigger='<C-e>'
" let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=[$VIMRCDIR.'/UltiSnips', 'ultisnips']
let g:UltiSnipsEnableSnipMate=1


" vim-airline/vim-airline
" -----------------------
set laststatus=2
let g:airline_theme='base16_harmonic_dark'

if has('gui')
  let g:airline_powerline_fonts = 0
else
  set guifont = "MesloLGM Nerd Font Mono:h14"
  let g:airline_powerline_fonts = 1
endif

let g:airline_skip_empty_sections = 1
let g:airline_section_c = "%f %{&readonly ? '[RO] ' : ''} %{exists('*FindSubName') ? FindSubName() : ''}"
let g:airline#extensions#tabline#buffer_idx_mode = 1  " show buffer nu
let g:airline#extensions#tabline#enabled = 1  " Automatically displays all buffers when there's only one tab open.

let g:airline_powerline_fonts = 1  " requires powerline-fonts

if &runtimepath =~ 'asyncrun'
  let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])
endif

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if get(g:, 'airline_powerline_fonts', 0)
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
  let g:airline_symbols.notexists = '∄'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '◀'
endif



" godlygeek/tabular
" -----------------------
" if exists(":Tabularize")
"    nmap <Leader>t= :Tabularize /=<CR>
"    vmap <Leader>t= :Tabularize /=<CR>
"    nmap <Leader>t: :Tabularize /:\zs<CR>
"    vmap <Leader>t: :Tabularize /:\zs<CR>
" endif

" inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

" function! s:align()
"     let p = '^\s*|\s.*\s|\s*$'
"     if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
"         let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
"         let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
"         Tabularize/|/l1
"         normal! 0
"         call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
"     endif
" endfunction


" plasticboy/vim-markdown
" -----------------------

" Disable folding.
let g:vim_markdown_folding_disabled=1

" Disable concealing some syntax.
" let g:vim_markdown_conceal = 0
" let g:vim_markdown_conceal_code_blocks = 0

" Enable LaTeX math.
let g:vim_markdown_math = 1

" Enable YAML Front Matter.
let g:vim_markdown_frontmatter = 1


" chusiang/vimcdoc-tw
" --------------------
set helplang=tw


" easymotion/vim-easymotion
" -------------------------
let g:EasyMotion_smartcase = 1


" mattn/emmet-vim
" -------------------------
" https://raw.githubusercontent.com/mattn/emmet-vim/master/TUTORIAL
let g:user_emmet_leader_key='<C-Z>'

" let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
" let g:user_emmet_mode='a'    "enable all function in all mode.



" majutsushi/tagbar
" ------------------
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0

if has('win32')
  let g:tagbar_ctags_bin='C:\ctags.exe'
endif

let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
      \ 'h:headings',
    \ ],
  \ 'sort' : 0
\ }


" Yggdroot/indentLine
" ------------------
let g:indentLine_char_list = ['¦', '┆', '┊']  " only work with file encoding UTF-8
let g:indentLine_setColors = 0  " use colourscheme default
let g:indentLine_conceallevel = 2


" mhinz/vim-startify
" ------------------
" TODO: recent git commit funcref
let g:startify_lists = [
      \ { 'type': 'files', 'header': ['    Recent Files'] },
      \ { 'type': 'dir', 'header': ['    Recent Directory Edit ('.getcwd().')']},
      \ { 'type': 'sessions', 'header': ['    Sessions']},
      \ { 'type': 'bookmarks', 'header': ['    Bookmarks']},
      \ ]

let g:startify_bookmarks = [{'d': $MYVIMDOT},]
let g:startify_files_number = 5
let g:startify_change_to_dir = 1

" TODO: Disable indentLine for a moment 
" if g:indentLine_enabled
"   IndentLinesToggle
" endif

let g:ascii_art = [
      \ '                           _ooOoo                ',
      \ '                          o8888888o                ',
      \ '                          88" . "88                ',
      \ '                          (| -_- |)                ',
      \ '                          O\  =  /O                ',
      \ "                       ____/`---'\____             ",
      \ "                     .'  \\\\|     |//  `.             ",
      \ '                    /  \\|||  :  |||//  \            ',
      \ '                   /  _||||| -:- |||||_  \           ',
      \ "                   |   | \\\\\\  -  /'| |   |            ",
      \ "                   |  _|  `\\\\`---'//  |_/ |            ",
      \ "                   \\ .-\\__ \\\\-. -'__/-.  /           ",
      \ "                 ___`. .'  /--.--\\  `. .'___            ",
      \ "              ./ / <  `.___\\_<|>_/___.' _> \\ \\.         ",
      \ "             | | :  `- \\`. ;`. _/; .'/ /  .' ; |          ",
      \ "             \  \ `-.   \\_\\_`. _.'_/_/  -' _.' /         ",
      \ "   ===========`-.`___`-.__\\ \\___/ /__.-'_.'_.-'=============   ",
      \ "                           `=--=-'                         ",
      \]

let g:startify_custom_header = startify#pad(g:ascii_art)


" liuchengxu/vim-which-key
" ------------------
" TODO: local keys for specific filetype
" ------ Misc ------
set timeoutlen=500
let g:which_key_map = {
  \ 'h' : 'Open Onesimos Documentation',
  \ 's' : { 'name' : 'Source', 'd' : 'Source Dotfile' },
  \ }

" ------ Toggle ------
let g:which_key_map['t'] = {
  \ 'name' : '+toggle',
  \ 'r' : 'Toggle Relative Numbering',
  \ 'w' : ['WPModeToggle', 'Toggle Word Processing Mode'],
  \ 'i' : ['IndentLinesToggle', 'Toggle Indent Indicator'],
  \ 'p' : ['ParenthesisToggle', 'Toggle Parenthesis Indicator'],
  \ }

" ------ Fuzzy finder ------
let g:which_key_map['f'] = {
  \ 'name' : '+Fuzzy',
  \ 'f' : 'In Situ',
  \ 'm' : 'Most Recent Files',
  \ 'b' : 'Buffer',
  \ 't' : 'Tags',
  \ 'l' : 'Line',
  \ }

" ------ Current File ------
let g:which_key_map['e'] = {
  \ 'name' : '+File',
  \ 'd' : 'Edit Dotfile',
  \ 'r' : ['Rename', 'Rename File'],
  \ 't' : 'Create Tags',
  \ 'w' : ['update', 'Write Changes'],
  \ 'p' : [':read !pbpaste', 'Paste Clipboard'],
  \ }

" ------ Window ------
let g:window_resize_f = 15

let g:which_key_map['w'] = {
  \ 'name' : '+Window',
  \ '-' : ['<C-W>s', 'Split Below'],
  \ '|' : ['<C-W>v', 'Split Right'],
  \ 'H' : [':vert res -'.g:window_resize_f, 'Resize Left'],
  \ 'J' : [':res +'.g:window_resize_f, 'Resize Down'],
  \ 'K' : [':res -'.g:window_resize_f, 'Resize Up'],
  \ 'L' : [':vert res +'.g:window_resize_f, 'Resize Left'],
  \ }

" ------ Version Control ------
let g:which_key_map['v'] = {
      \ 'name' : '+Git',
      \ 'b' : ['Gblame', 'fugitive-blame'],
      \ 'C' : ['Gcommit', 'fugitive-commit'],
      \ 'd' : ['Gdiff', 'fugitive-diff'],
      \ 'e' : ['Gedit', 'fugitive-edit'],
      \ 'l' : ['Glog', 'fugitive-log'],
      \ 'r' : ['Gread', 'fugitive-read'],
      \ 's' : ['Gstatus', 'fugitive-status'],
      \ 'w' : ['Gwrite', 'fugitive-write'],
      \ 'p' : ['Git push', 'fugitive-push'],
      \ }

" ------ Onesimos Settings ------
" TODO: unicode decoration
let g:which_key_map['\'] = {
  \ 'name' : 'Onesimos Vim Settings',
  \ 'u' : {
    \ 'name' : 'User Interface',
    \ 'c' : [':Leaderf colorscheme', 'Switch Colour Scheme'],
    \ 'b' : ['ToggleBackground', 'Toggle Background Colour']
    \ }
  \ }

" ------ Bookmark ------
" let g:which_bookmark_key_map = {}
" call which_key#register('M', 'g:which_bookmark_key_map')
" let g:which_bookmark_key_map = {
" \ 'name': '+bookmark',
" \ 'm':    'Toggle bookmark',
" \ 'i':    'Annotate bookmark',
" \ 'n':    'Next bookmark',
" \ 'p':    'Previous bookmark',
" \ 'a':    'Show all bookmark',
" \ 'c':    'Clear buffer bookmark',
" \ 'x':    'Clear all bookmark',
" \ }

" ------ WhichKey Settings ------
let g:which_key_use_floating_win = 1

call which_key#register('\', 'g:which_key_map')


" skywind3000/asyncrun.vim
" ------------------
let g:asyncrun_open = 8
" :AsyncRun -mode=term -pos=tab ls -la
" :AsyncRun -mode=term -pos=TAB -close -cwd=<root> ls -la
" :AsyncRun -mode=term -pos=TAB -cwd=<root> ls -la
" :AsyncRun -mode=term -pos=bottom -rows=10 ls -la"
" :AsyncRun -mode=term -pos=right -cols=80 ls -la"
" :AsyncRun -mode=term -pos=curwin python "$(VIM_FILEPATH)"
" :AsyncRun -mode=term -pos=curwin -hidden python "$(VIM_FILEPATH)"


" luochen1990/rainbow
" ------------------
let g:rainbow_active = 1 
	let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\		'nerdtree': 0,
	\	}
	\}