" =============================================================================
"  Author: Mikimoto / mikimoto (at) deepthought.com.tw
"  Blog: https://mikimoto.github.io
"  Filename:	06.functions.vim
"  Last Modified:	2022-11-17 23:19
"  Description: 
"  Reference: https://github.com/mikimoto/vimrc/blob/master/_vim/06.functions.vim
" =============================================================================

function RemoveTrailingWhitespace()
  if &ft != "diff"
    let b:curcol = col(".")
    let b:curline = line(".")
    silent! %s/\s\+$//
    silent! %s/\(\s*\n\)\+\%$//
    call cursor(b:curline, b:curcol)
  endif
endfunction

"autocmd BufWritePre * call RemoveTrailingWhitespace()
map <leader>0 :call RemoveTrailingWhitespace()<cr>


" Usage:
"
" :Rename[!] {newname}
" TODO:
" 	- if name.. , keep extension
" 	- change extension

command! -nargs=* -complete=file -bang Rename call Rename(<q-args>, '<bang>')

function! Rename(name, bang)
	let l:name    = a:name
	let l:oldfile = expand('%:p')

	if bufexists(fnamemodify(l:name, ':p'))
		if (a:bang ==# '!')
			silent exe bufnr(fnamemodify(l:name, ':p')) . 'bwipe!'
		else
			echohl ErrorMsg
			echomsg 'A buffer with that name already exists (use ! to override).'
			echohl None
			return 0
		endif
	endif

	let l:status = 1

	let v:errmsg = ''
	silent! exe 'saveas' . a:bang . ' ' . l:name

	if v:errmsg =~# '^$\|^E329'
		let l:lastbufnr = bufnr('$')

		if expand('%:p') !=# l:oldfile && filewritable(expand('%:p'))
			if fnamemodify(bufname(l:lastbufnr), ':p') ==# l:oldfile
				silent exe l:lastbufnr . 'bwipe!'
			else
				echohl ErrorMsg
				echomsg 'Could not wipe out the old buffer for some reason.'
				echohl None
				let l:status = 0
			endif

			if delete(l:oldfile) != 0
				echohl ErrorMsg
				echomsg 'Could not delete the old file: ' . l:oldfile
				echohl None
				let l:status = 0
			endif
		else
			echohl ErrorMsg
			echomsg 'Rename failed for some reason.'
			echohl None
			let l:status = 0
		endif
	else
		echoerr v:errmsg
		let l:status = 0
	endif

	return l:status
endfunction


" TODO: 
"  - expand macros as a function (%, filetype)
"  - HTML, and check if has ghc? initialise?
"  - detect io and switch to normal run mode.

func! s:CompileRun()
  " AsyncRun -save={0,1,2} -post
  " -mode={}

  " Retrieve file data
  " let header = getline(1) | let pos = stridx(header, '#!')
  let fname = expand('%')
  let frname = expand('%:r')
  let fpath = expand('%:p')

  " macOS absolute path has whitespaces
  if g:asc_uname ==? 'darwin'
    let fpath = substitute(fpath, '\ ', '\\ ', '')
  endif

  " Open terminal
  let g:compilerun_term = -1
  " if = 1, position

  " Auto open :copen
  let g:asyncrun_open = 8
  let g:asyncrun_bell = 1

  " Timer
  let g:compilerun_timer = 1
  if g:compilerun_timer
    let expr_timer = ''
  else
    let expr_time = ''
  endif

  exec 'w'

  " ------ Run part ------
  if &filetype ==? 'sh'
    call asyncrun#run('', {}, expr_timer.'bash '.fpath)
  elseif &filetype ==? 'python'
    call asyncrun#run('raw', {}, expr_timer.'python '.fpath)
  elseif &filetype ==? 'markdown'
    " exec '!~/.vim/markdown.pl % > %.html &'
    " exec '!open -a \"Google Chrome\" %.html &'  " only for macOS
    exec 'MarkdownPreview'
    echo 'Markdown Preview Toggled'
  elseif &filetype ==? 'tex'
    " vimtex compile key
    exec 'VimtexCompile'
  elseif &filetype ==? 'html'
    exec '!open -a "Google Chrome" % &'
  elseif &filetype ==? 'haskell'
    call asyncrun#run('', {}, expr_timer.'ghc '.fpath)
  elseif &filetype ==? 'vim'
    exec 'so %'
  elseif &filetype ==? 'dot'
    let imgname = frname.'.png'
    let command = 'dot -Tpng '.fpath.' -o '.imgname.' && open '.imgname
    call asyncrun#run('', {}, expr_timer.command)

  endif

  " ------ Compile part ------
  if &filetype ==? 'c'
    exec '!g++ % -o %<'
    " AsyncRun gcc -Wall -O2 '$(VIM_FILEPATH)' -o  '$(VIM_FILEDIR)/$(VIM_FILENOEXT)'
    exec '!time ./%<'
    " AsyncRun -raw -cwd=$(VIM_FILEDIR) '$(VIM_FILEDIR)/$(VIM_FILENOEXT)'
  elseif &filetype ==? 'cpp'
    exec '!g++ % -o %<'
    exec '!time ./%<'
  elseif &filetype ==? 'java'
    exec '!javac %'
    exec '!time java %<'
  elseif &filetype ==? 'go'
    exec '!go build %<'
    exec '!time go run %'
  endif

  " if filetype is not listed
  " echo 'CompileRun Error: Not a supported filetype!'
endfunc

command! CompileRun call <sid>CompileRun()

" Range support for assyncrun

func SetHeader()
  if &filetype ==? 'sh'
    call setline(1,"\#!/bin/bash")
    call append(line("."), "")
    elseif &filetype ==? 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# -*- coding: utf-8 -*-")
      call append(line(".")+1, "")
    elseif &filetype ==? 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
      call append(line(".")+1, "")
    elseif &filetype ==? 'typescript'
        call setline(1,"author Baksi")  " arbitrary

"    elseif &filetype ==? 'mkd'
"        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
  endif
  if expand("%:e") ==? 'cpp'
    call append(line(".")+6, "#include<iostream>")
    call append(line(".")+7, "using namespace std;")
    call append(line(".")+8, "")
  endif
  if &filetype ==? 'c'
    call append(line(".")+6, "#include<stdio.h>")
    call append(line(".")+7, "")
  endif
  if expand("%:e") ==? 'h'
    call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
    call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
    call append(line(".")+8, "#endif")
  endif
  if &filetype ==? 'java'
    call append(line(".")+6,"public class ".expand("%:r"))
    call append(line(".")+7,"")
  endif
  " go to the last line
  exec 'normal G'
endfunc

" File Header
au BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py,*.ts exec ":call SetHeader()"
