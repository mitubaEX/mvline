scriptencoding utf-8

if !exists('g:loaded_hellobeautifulworld')
    finish
endif
let g:loaded_hellobeautifulworld = 1

let s:save_cpo = &cpo
set cpo&vim

function! mvline#findLineNumberOfContainKeywordLine(l, c, str)
  let cMinus = a:c - 1

  let allContent = getline(a:l, '$')

  let count = 0
  let findFlag = 0

  for con in allContent
    let part = strpart(con, cMinus, 1)

    " check same char
    if a:str == part
      let findFlag = 1
      return [count, findFlag]
    endif

    let count += 1
  endfor

  return [count, findFlag]
endfunction

function! mvline#mvline()

  while 1
    let chr = getchar(0)
    if !empty(chr)
      break
    endif
    sleep 20m
  endwhile

  let chr = nr2char(chr)

  " get current lineNumber and columnNumber
  let l = line('.')
  let c = col('.')

  let l = l + 1

  let lineNumber = mvline#findLineNumberOfContainKeywordLine(l, c, chr)
  if lineNumber[1]
    let mvLineNumber = lineNumber[0] + l
    call cursor(mvLineNumber, c)
  endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
