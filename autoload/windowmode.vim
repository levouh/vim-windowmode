" --- Public Functions

    " Switch to the window management mode
    function! windowmode#interact()
        redraw | call s:windowmode_prompt('')

        while 1
            let l:char = s:windowmode_get_char()
            let l:lhs = l:char

            if g:_windowmode_exit
                let g:_windowmode_exit = 0
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
    endfunction

    " Mark a window to be pasted elsewhere
    function! windowmode#yank()
        let g:_windowmode_yank = winnr()

        redraw | echo 'Yanked window ' . g:_windowmode_yank
    endfunction

    " Paste the marked window
    function! windowmode#paste()
        if !exists('g:_windowmode_yank')
            return 'ERROR: No marked window'
        end

        let l:cur_num = winnr()
        let l:cur_buf = bufnr('%')

        exe g:_windowmode_yank . 'wincmd w'

        " Note the marked window's buffer number.
        let l:marked_buf = bufnr('%')

        exe 'hide buf' . l:cur_buf
        exe l:cur_num . 'wincmd w'

        " Place the marked buffer in the current window.
        exe 'hide buf' . l:marked_buf

        unlet g:_windowmode_yank
    endfunction

    " Get and process input from the user
    function! s:windowmode_get_char()
        let l:char = getchar()

        if l:char ==# 0x1B
            let g:_windowmode_exit = 1
        elseif l:char =~ '^\d\+$'
            return nr2char(l:char)
        else
            return l:char
        end
    endfunction

    " Draw the prompt
    function! s:windowmode_prompt(mode, ...)
        redraw | echo '[' . g:windowmode_prefix . ']> ' . a:mode
    endfunction

