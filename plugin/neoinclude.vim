if exists('did_coc_neoinclude_loaded') | finish | endif
let did_coc_neoinclude_loaded = 1

let s:folder = expand('<sfile>:h:h')

call coc#util#regist_extension(s:folder)
