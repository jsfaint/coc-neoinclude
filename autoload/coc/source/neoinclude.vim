function! coc#source#neoinclude#init() abort
  return {
        \ 'priority': 9,
        \ 'shortcut': 'FI',
        \}
endfunction

function! coc#source#neoinclude#should_complete(opt) abort
  return 1
endfunction

function! coc#source#neoinclude#get_startcol(opt) abort
  let colnr = a:opt['colnr']
  let part = colnr == 1 ? '' : a:opt['line'][0:colnr-2]

  let col = neoinclude#file_include#get_complete_position(part)
  let ch = a:opt['line'][col + 1]
  if ch ==# ':'
    return col + 2
  endif
  return col
endfunction

function! coc#source#neoinclude#complete(opt, cb) abort
  let colnr = a:opt['colnr']
  let input = a:opt['input']
  let part = a:opt['line'][0:colnr - 2]

  let changed = get(a:opt, 'changed', 0)
  if changed < 0
    let changed = 0
  endif
  let items = neoinclude#file_include#get_include_files(part)
  call a:cb(s:Filter(input, items, changed))
endfunction

function! s:Filter(input, items, index)
  let ch = a:input[a:index]
  let colon = a:input =~# '\v^(g|l|s):'
  let res = []
  for item in a:items
    let word = item['word']
    if !empty(ch) && word[a:index] !=# ch
      continue
    endif
    if !colon && word[1:1] =~# ':'
      continue
    endif
    let o = {}
    for [key, value] in items(item)
      if key ==# 'word' && value =~# '($'
        let o[key] = value[0:-2]
      elseif key ==# 'word' && value =~# '()$'
        let o[key] = value[0:-3]
      elseif key ==# 'word' && colon
        let o[key] = value[2:]
      else
        let o[key] = value
      endif
    endfor
    call add(res, o)
  endfor
  return res
endfunction
