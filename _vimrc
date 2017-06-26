set nocompatible
set clipboard+=unnamedplus
set autochdir
set fileformat=unix
set autoread
set ignorecase
set smartcase
behave mswin

set hidden
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set expandtab
set ttyfast
set nowrap
set switchbuf=useopen,split

set noswapfile
set incsearch
set hlsearch
set cindent
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set vb t_vb=
colorscheme handmade
set guifont=Liberation_Mono:h11
hi VertSplit guifg=#888888 guibg=#222222 gui=bold

filetype plugin indent on
syntax on
set completeopt=longest,menuone,preview

call plug#begin()
Plug 'skywind3000/asyncrun.vim'
Plug 'tikhomirov/vim-glsl'
Plug 'ervandew/supertab'
Plug 'craigemery/vim-autotag'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/taglist.vim'
call plug#end()

autocmd! BufNewFile, BufRead *.glsl *.geom *.vert *.frag set filetype=glsl

let g:autotagTagsFile='./tags'
let g:autotagCtagsCmd='C:/ctags/ctags.exe'
set tags+=./tags

let Tlist_Ctags_Cmd='C:/ctags/ctags.exe'

"handmade build
function! BuildProject()
    wa
    "set makeprg=build.bat
    AsyncRun build.bat
    botright copen
    call feedkeys("\<c-w>\<c-p>")
endfunction

nnoremap <m-m> :call BuildProject()<CR>
nnoremap <m-r> :AsyncRun ..\build\win32_main.exe<CR>
nnoremap <m-n> :cn<CR>
nnoremap <m-p> :cp<CR>
nnoremap <m-,> :cclose<CR>
inoremap jk <ESC>
inoremap <esc> <nop>

let mapleader = ' '
let g:mapleader = ' '
nnoremap <leader>v :e $HOME/_vimrc<CR>


