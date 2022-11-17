" =============================================================================
"  Author: Mikimoto / mikimoto (at) deepthought.com.tw
"  Blog: https://mikimoto.github.io
"  Filename:	vimrc
"  Last Modified:	2022-11-17 23:18
"  Description: 
"  Reference: https://github.com/mikimoto/vimrc/blob/master/vimrc
" =============================================================================

" Support the Python 3
" --------------------

if has('mac')
  if has('python3')
    command! -nargs=1 Py py3 <args>
    set pythonthreedll=/usr/local/Frameworks/Python.framework/Versions/3.10/Python
    set pythonthreehome=/usr/local/Frameworks/Python.framework/Versions/3.10
  else
    command! -nargs=1 Py py <args>
    set pythondll=/usr/local/Frameworks/Python.framework/Versions/2.7/Python
    set pythonhome=/usr/local/Frameworks/Python.framework/Versions/2.7
  endif
endif


" dein Scripts
" ------------

if &compatible
  set nocompatible
endif

" Required:
set runtimepath+=$HOME/.vim/bundle/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.vim/bundle')
  call dein#begin('$HOME/.vim/bundle')

  " Let dein manage dein
  " Required:
  call dein#add('$HOME/.vim/bundle/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here
  " -------------------------------

  call dein#add('junegunn/fzf', { 'build': './install', 'merged': 0 })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  call dein#add('Shougo/vimshell.vim')

  call dein#add('chriskempson/base16-vim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('dawikur/base16-vim-airline-themes')

  call dein#add('Valloric/YouCompleteMe', {'build': './install.py'})
  call dein#add('scrooloose/nerdtree')
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  call dein#add('SirVer/ultisnips')  
  call dein#add('godlygeek/tabular')
  call dein#add('plasticboy/vim-markdown')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('Yggdroot/indentLine')
  call dein#add('majutsushi/tagbar')
  call dein#add('tpope/vim-surround')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('easymotion/vim-easymotion')
  call dein#add('mattn/emmet-vim')
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('mhinz/vim-startify')
  call dein#add('liuchengxu/vim-which-key')
  call dein#add('skywind3000/asyncrun.vim')
  call dein#add('tpope/vim-commentary')
  call dein#add('luochen1990/rainbow', { 'on': 'RainbowToggle' })

  call dein#add('chusiang/vimcdoc-tw')

  " call dein#add('BaksiLi/vim-applescript')
  " call dein#add('bumaociyuan/vim-swift')
  " call dein#add('xu-cheng/brew.vim')
  " call dein#add('othree/html5.vim')
  " call dein#add('hail2u/vim-css3-syntax')
  " call dein#add('gko/vim-coloresque')
  " call dein#add('itspriddle/vim-jquery')
  " call dein#add('tpope/vim-ragtag')
  " call dein#add('chr4/nginx.vim')
  " call dein#add('ekalinin/Dockerfile.vim')
  " call dein#add('pearofducks/ansible-vim')
  " call dein#add('mileszs/ack.vim')
  " call dein#add('vim-scripts/pythoncomplete')
  " call dein#add('othree/yajs.vim')


  " call dein#add('nvim-treesitter/nvim-treesitter')
  " call dein#add('numToStr/Comment.nvim')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif


" Read other vim script, if available
" -----------------------------------

for CONFIG in split(glob('~/.vim/*.vim'), '\n')
   exe 'source' CONFIG
endfor
