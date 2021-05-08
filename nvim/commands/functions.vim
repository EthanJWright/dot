" adjust pane layout with toggle C-y
fun! PANEHOR()
    wincmd t
    wincmd H
endfun

fun! PANEVERT()
    wincmd t
    wincmd K
endfun

" Toggle between vertical and horizontal layout
let g:vert = 0
fun! PANETOG()
    if g:vert
        call PANEVERT()
        let g:vert=0
    else
        call PANEHOR()
        let g:vert=1
    endif
endfun
nnoremap <C-y> :call PANETOG()<CR>

fun! ALIGN()
    :execute "normal! mtggvG='tzz"
endfun
command AL :call ALIGN()

fun! FORMAT()
    :execute "normal! mtgggqG'tzz"
endfun
command FO :call FORMAT()

function! s:get_visual_selection()
    " Why is this not a built-in Vim script function?!
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction
