call plug#begin('~/vimfiles/plugged')
Plug 'skywind3000/asyncrun.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tomasr/molokai'
call plug#end()

"extra CtrlP settings
let g:ctrlp_custom_ignore={
            \ 'dir': '.git$|public$|log|tmp$',
            \ 'file': '.DS_Store$',
            \ } 
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:working_path_mode='ra'
let g:ctrlp_max_files=0
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40

set nocompatible
set clipboard=unnamed
set autochdir

filetype plugin indent on
syntax on

"functionalities
set hidden
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set expandtab
set number
set ttyfast
set nowrap

"looks
colo molokai
colorscheme molokai
set guifont=Liberation_Mono:h11
set autochdir
set noswapfile
set guioptions-=m "remove menu bar
set guioptions-=T "remove tool bar
set guioptions-=r "remove right-hand scrollbar
set guioptions-=L "remove left-hand scrollbar

"inoremap jk <esc> 
"inoremap <esc> <nop> 

"emulate emac's build
"set switchbuf=useopen,split
function! BuildProject()
"    set makeprg=build.bat
"    silent :Asyncrun make 
    AsyncRun build.bat
    copen
    echo "Build Complete"
endfunction

nnoremap <m-m> :call BuildProject()<CR>
nnoremap <m-n> :cn<CR>
nnoremap <m-p> :cp<CR>
