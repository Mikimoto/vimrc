" =============================================================================
"  Author: Mikimoto / mikimoto (at) deepthought.com.tw
"  Blog: https://mikimoto.github.io
"  Filename:	03.keymap.vim
"  Last Modified:	2022-11-17 23:19
"  Description: 
"  Reference: https://github.com/mikimoto/vimrc/blob/master/_vim/03.keymap.vim
" =============================================================================

" Better tab experience - from https://webdevetc.com/
map <leader>tn :tabnew<cr>
map <leader>t<leader> :tabnext
map <leader>tm :tabmove
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>


" Valloric/YouCompleteMe (code-completion)
" ----------------------------------------
nmap <silent> <leader>yg :YcmCompleter GoTo<CR>
nmap <silent> <leader>yf :YcmCompleter FixIt<CR>


" scrooloose/nerdtree
" ----------------------------------------
nnoremap <silent> <C-d> :NERDTreeToggle <CR>
nmap <leader>r :NERDTreeRefreshRoot <CR>


" plasticboy/vim-markdown
" -----------------------
nnoremap <expr><enter> &ft=="qf" ? "<cr>:lcl<cr>" : (getpos(".")[2]==1 ? "i<cr><esc>": "i<cr><esc>l")


" airblade/vim-gitgutter
" ----------------------
nmap <leader>g :GitGutterToggle<CR>

" jump next/previous bunks.
nmap gh <Plug>GitGutterNextHunk
nmap gH <Plug>GitGutterPrevHunk


" easymotion/vim-easymotion
" -------------------------
" <Leader>f{char} to move to {char}
map  <leader>f <Plug>(easymotion-bd-f)
nmap <leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
" nmap s <Plug>(easymotion-overwin-f2)
nmap s <Plug>(easymotion-s2)
" nmap t <Plug>(easymotion-t2)

" Move to line
" map <Leader>l <Plug>(easymotion-bd-jk)
" nmap <Leader>l <Plug>(easymotion-overwin-line)

" Move to word
map  <leader>w <Plug>(easymotion-bd-w)
nmap <leader>w <Plug>(easymotion-overwin-w)

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)


" majutsushi/tagbar
" ------------------
nmap <leader>tg :<C-u>TagbarToggle<CR>


" liuchengxu/vim-which-key
" ------------------
nnoremap <silent> <leader> :<c-u>WhichKey '\'<CR>
vnoremap <silent> <leader> :<c-u>WhichKey '\'<CR>
