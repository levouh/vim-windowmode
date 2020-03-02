## vim-windowmode

_Sub-mode emulation for operating on different windows._


### Support

_I have only tested this plugin with the following:_  
- _Vim_: 8.2.227  
- _OS_: Linux

### Installation

```
Plug 'levouh/vim-windowmode'
```

### Setup

Simple add a mapping to enter the sub-mode:

```
nnoremap <silent> gw :WMInteract<CR>
```

### Configuration

This plugin reads actions from a globally defined `g:windowmode_map`, which has a default of:

```
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
```

This mapping is global, so you can redefine it yourself or simply add things to it.

When in window mode, a prefix will show at the bottom of the screen. To change this prefix:

```
let g:windowmode_prefix = 'Window Mode'
```

or something similar.

### Mentions

Most of this plugin is taken directly from [winteract.vim](https://github.com/romgrk/winteract.vim).
