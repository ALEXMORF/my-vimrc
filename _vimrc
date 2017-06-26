set nocompatible
set clipboard+=unnamedplus
set autochdir
set fileformat=unix
set autoread
set ignorecase
set smartcase
behave mswin

set hidden
set ruler
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set expandtab
set ttyfast
set nowrap
set switchbuf=useopen,split
set guifont=Liberation_Mono:h11
colorscheme handmade

set noswapfile
set incsearch
set hlsearch
set cindent
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set vb t_vb=
set laststatus=2

filetype plugin indent on
syntax on
set completeopt=longest,menuone,preview

"a better cursor
highlight Cursor guifg=#191970 guibg=#40FF40
set cursorline
highlight CursorLine guifg=fg guibg=#191970

"highlight my keywords
highlight TodoHighlight guifg=red guibg=bg gui=bold
highlight NoteHighlight guifg=green guibg=bg gui=bold
highlight ImportantHighlight guifg=yellow guibg=bg gui=bold
let m1 = matchadd("TodoHighlight", "TODO")
let m2 = matchadd("NoteHighlight", "NOTE")
let m3 = matchadd("ImportantHighlight", "IMPORTANT")

call plug#begin()
Plug 'skywind3000/asyncrun.vim'
Plug 'tikhomirov/vim-glsl'
Plug 'ervandew/supertab'
Plug 'craigemery/vim-autotag'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-shell'
Plug 'xolox/vim-session'
call plug#end()

autocmd! BufNewFile, BufRead *.glsl *.geom *.vert *.frag set filetype=glsl

let g:autotagTagsFile='./tags'
let g:autotagCtagsCmd='C:/ctags/ctags.exe'
set tags+=./tags

let g:session_autosave='no'
let g:session_autoload='no'

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

ab os OpenSession
ab ss SaveSession
