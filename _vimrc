set nocompatible
behave mswin
filetype plugin indent on
syntax on
set wildmenu
set completeopt=longest,menuone,preview

set autochdir
set fileformat=unix
set autoread
set ignorecase
set smartcase

set relativenumber
set number
set hidden
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set expandtab
set ttyfast
set nowrap
set switchbuf=useopen,usetab
set guifont=Liberation_Mono:h11
set ruler

set noswapfile
set incsearch
set hlsearch
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set laststatus=2
set novisualbell
set vb t_vb=

call plug#begin('~/.vim/plugged')
Plug 'skywind3000/asyncrun.vim'
Plug 'mattn/emmet-vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'xolox/vim-shell'
Plug 'wlangstroth/vim-racket'
Plug 'tikhomirov/vim-glsl'
Plug 'ervandew/supertab'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'flazz/vim-colorschemes'
call plug#end()

let g:session_autosave='no'

colorscheme gruvbox
inoremap jk <ESC>

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

:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" Microsoft MSBuild
set errorformat+=\\\ %#%f(%l\\\,%c):\ %m
" Microsoft compiler: cl.exe
set errorformat+=\\\ %#%f(%l)\ :\ %#%t%[A-z]%#\ %m
" Microsoft HLSL compiler: fxc.exe
set errorformat+=\\\ %#%f(%l\\\,%c-%*[0-9]):\ %#%t%[A-z]%#\ %m
