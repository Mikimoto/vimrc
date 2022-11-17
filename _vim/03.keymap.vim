" =============================================================================
"  Author: Mikimoto / mikimoto (at) deepthought.com.tw
"  Blog: https://mikimoto.github.io
"  Filename:	03.keymap.vim
"  Last Modified:	2022-11-17 01:06
"  Description: 
"  Reference: https://github.com/mikimoto/vimrc/blob/master/_vim/03.keymap.vim
" =============================================================================

" Valloric/YouCompleteMe (code-completion)
" ----------------------------------------
nmap <silent> <leader>yg :YcmCompleter GoTo<CR>
nmap <silent> <leader>yf :YcmCompleter FixIt<CR>

" scrooloose/nerdtree
" ----------------------------------------
nnoremap <silent> <C-a> :NERDTreeToggle <CR>
nmap <leader>r :NERDTreeRefreshRoot <CR>