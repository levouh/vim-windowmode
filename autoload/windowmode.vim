fu! windowmode#interact() " {{{1
    " Switch to the window management mode
    redraw | call s:windowmode_prompt('')

    while 1
        let l:char = s:windowmode_get_char()
        let l:lhs = l:char

        if exists('s:_windowmode_exit') && s:_windowmode_exit
            let s:_windowmode_exit = 0
            break
        endif

        if !exists('g:windowmode_map[l:lhs]')
            call s:windowmode_prompt('')
            continue
        end

        let l:rhs = g:windowmode_map[l:lhs]

        exe rhs

        call s:windowmode_prompt('')
    endwhile

    echo '\r'
    redraw
endfu

fu! windowmode#yank() " {{{1
    " Mark a window to be pasted elsewhere
    let s:_windowmode_yank = winnr()

    redraw | echohl WarningMsg | echo "Yanked bufer " .. s:_windowmode_yank | echohl None
    sleep 200m
endfu

fu! windowmode#paste() " {{{1
    " Paste the marked window
    if !exists('s:_windowmode_yank')
        return 'ERROR: No marked window'
    end

    let l:cur_num = winnr()
    let l:cur_buf = bufnr('%')

    exe s:_windowmode_yank . 'wincmd w'

    " Note the marked window's buffer number.
    let l:marked_buf = bufnr('%')

    exe 'hide buf' . l:cur_buf
    exe l:cur_num . 'wincmd w'

    " Place the marked buffer in the current window.
    exe 'hide buf' . l:marked_buf

    unlet s:_windowmode_yank
endfu

fu! s:windowmode_get_char() " {{{1
    " Get and process input from the user
    let l:char = getchar()

    if l:char ==# 0x1B
        let s:_windowmode_exit = 1
    elseif l:char =~ '^\d\+$'
        return nr2char(l:char)
    else
        return l:char
    end
endfu

fu! s:windowmode_prompt(mode, ...) " {{{1
    " Draw the prompt
    redraw | echo '--' . g:windowmode_prefix . '--' . a:mode
endfu

