"""""""""""""""""""""""
"" From Vim Sensible ""
"""""""""""""""""""""""

filetype plugin indent on

syntax enable

" Hybrid line numbers
:set number relativenumber
:set nu rnu

set autoindent

set backspace=indent,eol,start

" The i option states that it will “scan current and included files”, which might pollute
" the autocomplete results if your current file includes a lot of other files. As such, it
" makes sense to disable this option.
set complete-=1

set smarttab

" The octal option will cause 007 to be incremented to 010 due to using base 8. In normal usage,
" this is not the expected behaviour since not a lot of people are using base 8 in their daily work.
" By disabling it, 007 will be incremented to 008.
set nrformats-=octal

" By default, the value of ttimeoutlen is -1, which will be changed to 100, but this line sets it
" explicitly instead. If you set ttimeoutlen to 5000, every time you hit the Esc key, it will
" wait 5 seconds before registering the Esc command. This is due to Vim thinking there is a chance
" that you will press the rest of the key codes within the 5 seconds window.
" if !has(‘nvim’) && &ttimeoutlen == -1
"   set ttimeout
"   set ttimeoutlen=100
" endif

" Incremental search or incsearch allows Vim to directly go to the next matching result as you type
"  your search keywords. Without this setting, you need to press Enter to make Vim go to the search result.

set incsearch

" Always show Vim status bar
set laststatus=2

set ruler

" Show the possible completion above the command-line.
set wildmenu

" This will make Vim automatically read a file when it detects that the file has been changed outside of Vim.
set autoread

" Set higher history for : commands, search strings, expressions, input lines and debug mode commands.
set history=1000

" Set Vim cache file.
set viminfo^=!

"""""""""""""""""""""""""""
"" Personal Vim settings ""
"""""""""""""""""""""""""""

" Automatically runs Vim commands in the current dir (nice, but conflicts with
" Telescope
" set autochdir

set termguicolors
set clipboard=unnamedplus
set scrolloff=8
set sidescrolloff=8
set splitright

"""""""""""""
"" Keymaps ""
"""""""""""""
nnoremap <SPACE> <Nop>
let mapleader=" "

" When using 'go to file', create the file if it doesn't exist.
map gf :edit <cfile><cr>

" d still 'cuts' and p still 'pastes', while <leader>d deletes for real and <leader>p throws away the selected text and pastes the content of the default register. <leader>p allows me to paste the same text multiple times without having to use named registers.
nnoremap <leader>d "_d
xnoremap <leader>d "_d
xnoremap <leader>p "_dP
