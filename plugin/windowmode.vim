" Verification {{{1

    if exists('g:_loaded_windowmode') || v:version < 802
        finish
    endif

    let g:_loaded_windowmode = 1

" Options {{{1

    if !exists('g:windowmode_map')
        let g:windowmode_map = {
                             \ "h": "normal! \<C-w><",
                             \ "j": "normal! \<C-w>-",
                             \ "k": "normal! \<C-w>+",
                             \ "l": "normal! \<C-w>>",
                             \ "=": "normal! \<C-w>=",
                             \ "o": "normal! \<C-w>o",
                             \ "H": "normal! \<C-w>H",
                             \ "J": "normal! \<C-w>J",
                             \ "\<C-h>": "normal! \<C-w>h",
                             \ "\<C-j>": "normal! \<C-w>j",
                             \ "\<C-k>": "normal! \<C-w>k",
                             \ "\<C-l>": "normal! \<C-w>l",
                             \ "n": "normal! :bn\<CR>",
                             \ "N": "normal! :bp\<CR>",
                             \ "s": "normal! \<C-w>s" ,
                             \ "v": "normal! \<C-w>v" ,
                             \ "d": "bdelete",
                             \ "\<A-w>": "normal! \<C-w>p",
                             \ ";": "bot ter",
                             \ "y": "call windowmode#yank()",
                             \ "p": "call windowmode#paste()",
                             \ }
    endif

    let g:windowmode_prefix = 'WINDOW'

" Variables {{{1

    let g:_windowmode_exit = 0

" Commands {{{1

    command! WMInteract call windowmode#interact()
