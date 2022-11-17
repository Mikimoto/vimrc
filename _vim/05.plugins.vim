" =============================================================================
"  Author: Mikimoto / mikimoto (at) deepthought.com.tw
"  Blog: https://mikimoto.github.io
"  Filename: 05.plugins.vim
"  Last Modified: 2022-11-17 09:29
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
autocmd VimEnter * call StartUp()


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

nnoremap <expr><enter> &ft=="qf" ? "<cr>:lcl<cr>" : (getpos(".")[2]==1 ? "i<cr><esc>": "i<cr><esc>l")


" airblade/vim-gitgutter
" ----------------------
nmap <leader>g :GitGutterToggle<CR>

" jump next/previous bunks.
nmap gh <Plug>GitGutterNextHunk
nmap gH <Plug>GitGutterPrevHunk
