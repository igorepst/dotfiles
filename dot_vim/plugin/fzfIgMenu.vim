if exists('g:fzfIgMenu_loaded')
  finish
endif
let g:fzfIgMenu_loaded = 1

if !exists('g:fzfIgMenu_dict') | let g:fzfIgMenu_dict = {} | endif

for [key, value] in items(g:fzfIgMenu_dict)
    " Capitalize and trim whitespace in key
    let keyr = 'Ig' . substitute(substitute(key, '\(\<.\)', '\u&', 'g'), '\(\s\+\)', '', 'g')
    execute 'command! ' . keyr . ' ' . value['f']
    if has_key(value, 'k')
        execute 'nnoremap ' . value['k'] . ' :' . keyr . '<CR>'
    endif
endfor

function! s:fzfIgMenuRun(e)
    for [key, value] in items(g:fzfIgMenu_dict)
        if key ==# a:e
            execute value['f']
            break
        endif
    endfor
endfunction

nnoremap <Plug>FzfIgMenuOpen :call fzf#run({'source': sort(keys(g:fzfIgMenu_dict)), 'sink': function('<sid>fzfIgMenuRun'), 
            \ 'options': '--reverse', 'down': '40%'})<CR>
