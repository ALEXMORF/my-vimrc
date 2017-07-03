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
set cindent
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set laststatus=2
set vb t_vb=

call plug#begin()
Plug 'skywind3000/asyncrun.vim'
Plug 'kien/ctrlp.vim'
Plug 'tikhomirov/vim-glsl'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'ervandew/supertab'
Plug 'craigemery/vim-autotag'
Plug 'tpope/vim-surround'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-shell'
Plug 'xolox/vim-session'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
call plug#end()

colorscheme gruvbox

"highlight my keywords
highlight VertSplit guibg=bg 
highlight TodoHighlight guifg=red guibg=bg gui=bold
highlight NoteHighlight guifg=green guibg=bg gui=bold
highlight ImportantHighlight guifg=yellow guibg=bg gui=bold
let m1 = matchadd("TodoHighlight", "TODO")
let m2 = matchadd("NoteHighlight", "NOTE")
let m3 = matchadd("ImportantHighlight", "IMPORTANT")

autocmd! BufNewFile, BufRead *.glsl set filetype=glsl

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

"clang formatter with python
map <C-K> :pyf C:\Program Files (x86)\LLVM\share\clang\clang-format.py<cr>
imap <C-K> <c-o>:pyf C:\Program Files (x86)\LLVM\share\clang\clang-format.py<cr>

let mapleader = ' '
let g:mapleader = ' '
nnoremap <leader>v :e $HOME/_vimrc<CR>
nnoremap <leader>n :noh<CR>
nnoremap <leader>r :AsyncRun ..\build\win32_main.exe<CR>

ab os OpenSession
ab ss SaveSession
