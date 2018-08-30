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
  let columnCount = 0
  let findFlag = 0

  for con in allContent
    for t in range(0, len(con))
      if a:str == con[t]
        let findFlag = 1
        let columnCount = t + 1
        return [count, columnCount, findFlag]
      endif
    endfor

    let count += 1
  endfor

  return [count, cMinus, findFlag]
endfunction

function! mvline#mvline()

  let chr = nr2char(getchar())

  " get current lineNumber and columnNumber
  let l = line('.')
  let c = col('.')

  let l = l + 1

  let lineNumber = mvline#findLineNumberOfContainKeywordLine(l, c, chr)
  if lineNumber[2]
    let mvLineNumber = lineNumber[0] + l
    call cursor(mvLineNumber, lineNumber[1])
  endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
