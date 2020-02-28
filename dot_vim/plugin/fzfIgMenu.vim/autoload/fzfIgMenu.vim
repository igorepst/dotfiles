function! fzfIgMenu#fzfIgMenuCreateCmd() abort
    for [key, value] in items(g:fzfIgMenu_dict)
        " Capitalize and trim whitespace in key
        let keyr = g:fzfIgMenu_cmdPrefix . substitute(substitute(key, '\(\<.\)', '\u&', 'g'), '\(\s\+\)', '', 'g')
        execute 'command! ' . keyr . ' ' . value['f']
        if has_key(value, 'k')
            execute 'nnoremap ' . value['k'] . ' :' . keyr . '<CR>'
        endif
    endfor
endfunction

function! fzfIgMenu#fzfIgMenuRun(e) abort
    for [key, value] in items(g:fzfIgMenu_dict)
        if key ==# a:e
            execute value['f']
            break
        endif
    endfor
endfunction
