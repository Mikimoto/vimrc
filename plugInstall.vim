" ------ IDE and UI features ------
Plug 'mhinz/vim-startify'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-eunuch'

" ------ Colour Schemes ------
" TODO: Airline remove battery, add pyenv, cf :h statusline
"   if font not compatible, use other seperator
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'morhetz/gruvbox'

" ------ Editing ------
" Parentheses helper
Plug 'tpope/vim-surround'
" Reapeating plugin
Plug 'tpope/vim-repeat'
" Comment operator (gc)
Plug 'tpope/vim-commentary'
" Tabular
Plug 'godlygeek/tabular'

" Multi-cursor is poisonous
Plug 'terryma/vim-multiple-cursors'

" Improved increment <C-a>/<C-x>
Plug 'tpope/vim-speeddating'

" Undo Tree
" Plug 'mbbill/undotree'

" ------ Git Support ------
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'  "faster than vim-gitgutter
Plug 'mattn/vim-gist', { 'on': 'Gist'}
  let g:gist_open_browser_after_post = 1
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'junegunn/vim-emoji'
"   command! -range EmojiReplace <line1>,<line2>s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g

" Auxiliary indicator
Plug 'Yggdroot/indentLine'
Plug 'luochen1990/rainbow', { 'on': 'RainbowToggle' }
  let g:rainbow_active = 0  " default off

" Focus mode
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Snippets
Plug 'SirVer/ultisnips'
":CocInstall coc-snippets
" Plug 'honza/vim-snippets'

" ------ Shell ------
" Assync Run (Vim 8?)
Plug 'skywind3000/asyncrun.vim'
" Plug 'skywind3000/asynctasks.vim'  " this is good but a bit heavy

" Stats
" Plug 'dstein64/vim-startuptime'

Plug 'liuchengxu/vim-which-key'
Plug 't9md/vim-choosewin'

" Fuzzy finder
Plug 'Yggdroot/LeaderF', { 'do': '.\install.bat' }
" fzf can integrate ag, awk etc

