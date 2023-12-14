vim.cmd([[

""""""""""""""""""""""""""""""""""""""
" => Settings
"""""""""""""""""""""""""""""""""""""""
let mapleader = ","			    " Leader key
set clipboard+=unnamedplus
set number relativenumber		" Line numbering
set nohlsearch                  " No highlight
set ignorecase                  " Case Insensitive search
set smartcase
set nobackup                    " No backup files
set nowrap
set encoding=UTF-8
set scrolloff=10
set mouse= " Disable mouse


"""""""""""""""""""""""""""""""""""""""
" => Theme
"""""""""""""""""""""""""""""""""""""""
syntax on
set t_Co=256
set termguicolors

" start screen
let g:startify_custom_header = [
            \
            \ ' ██╗   ██╗██╗███╗   ███╗',
            \ ' ██║   ██║██║████╗ ████║',
            \ ' ██║   ██║██║██╔████╔██║',
            \ ' ╚██╗ ██╔╝██║██║╚██╔╝██║',
            \ '  ╚████╔╝ ██║██║ ╚═╝ ██║',
            \ '   ╚═══╝  ╚═╝╚═╝     ╚═╝',
          \]

"""""""""""""""""""""""""""""""""""""""
" => Code sytling
"""""""""""""""""""""""""""""""""""""""
set tabstop=4
set shiftwidth=4
set expandtab

" tabs
set hidden

]])
