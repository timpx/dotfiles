"" activate python syntax
syntax on
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
"" for easy installation
"filetype off
execute pathogen#infect()
call pathogen#infect()
call pathogen#helptags()

""" allow smart indent
filetype plugin indent on

""" for vim-slime to tmux
let g:slime_target = "tmux"

""" disable arrow keys
noremap <Up> <NoP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

""" line numbers
set number
"set colorcolumn=80
highlight ColorColumn ctermbg=223

""" for ctrl-p vim
set runtimepath^=~/.vim/bundle/ctrlp.vim

""" change leader key
let mapleader = ","

""" open fold by default 
set foldlevelstart=20

""" monokai colors
set t_Co=256
let g:molokai_original = 1
let g:rehash256 = 1
let g:pymode = 0

""" to send enter for tslime/python
map <C-c><C-c> "ry :call Send_to_Tmux(@r . "\n\n")<CR>
map ù mtvip"ry :call Send_to_Tmux(@r . "\n\n")<CR>

