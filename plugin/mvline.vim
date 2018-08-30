scriptencoding utf-8

if exists('g:loaded_hellobeautifulworld')
    finish
endif
let g:loaded_hellobeautifulworld = 1

let s:save_cpo = &cpo
set cpo&vim

nmap z :call mvline#mvline()<CR>

let &cpo = s:save_cpo
unlet s:save_cpo
