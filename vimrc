call plug#begin('$VIM/vimfiles/plugin')
call plug#end()

set nocompatible
set clipboard=unnamed

filetype plugin indent on
syntax on

set hidden
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set expandtab

set number
set ttyfast
set nowrap

colorscheme evening
set guifont=Liberation_Mono:h11
set autochdir
set noswapfile
set guioptions-=m "remove menu bar
set guioptions-=T "remove tool bar
set guioptions-=r "remove right-hand scrollbar
set guioptions-=L "remove left-hand scrollbar

inoremap jk <esc> 
inoremap <esc> <nop> 

"emulate emac's build
"set switchbuf=useopen,split
function! BuildProject()
    set makeprg=build.bat
    silent make
    copen
    echo "Build Complete"
endfunction

nnoremap <m-m> :call BuildProject()<CR>
nnoremap <m-n> :cn<CR>
nnoremap <m-p> :cp<CR>

