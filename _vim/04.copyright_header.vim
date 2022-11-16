" =============================================================================
"  Author:  Mikimoto / mikimoto (at) deepthought.com.tw
"  Blog:  https://mikimoto.github.io
"  Filename:	04.copyright_header.vim
"  Last Modified:	2022-11-16 23:29
"  Description: Copyright header update.
"  Reference: https://github.com/mikimoto/vimrc/blob/master/_vim/04.copyright_header.vim
" =============================================================================

" Add and update declare.
map <leader>a :call TitleDet()<cr>'s

function! AddTitle()
  call append(1,"# =============================================================================")
  call append(2,"#  Author: Mikimoto / mikimoto (at) deepthought.com.tw")
  call append(3,"#  Blog: https://mikimoto.github.io")
  call append(4,"#  Filename: ".expand("%:t"))
  call append(5,"#  Last Modified: ".strftime("%Y-%m-%d %H:%M"))
  call append(6,"#  Description: ")
  call append(7,"#  Reference:")
  call append(8,"# =============================================================================")
  echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endf

" Update/modify time and Filename.
function! UpdateTitle()
  normal m'
  execute '/ *Last Modified:/s@:.*$@\=strftime(":\t%Y-%m-%d %H:%M")@'
  normal ''
  normal mk
  execute '/ *Filename:/s@:.*$@\=":\t".expand("%:t")@'
  execute "noh"
  normal 'k
  echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction

" If the first seven lines of code in Last modified only updated, if not then
" declare new information.
function! TitleDet()
  let n=1
  " New information is expected to be declared.
  while n < 7
    let line = getline(n)
    if line =~ '\s*\S*Last\ Modified:\S*.*$'
      call UpdateTitle()
      return
    endif
    let n = n + 1
  endwhile
  call AddTitle()
endfunction
