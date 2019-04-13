" what is the name of the directory containing this file?
"let s:portable = expand('<sfile>:p:h')

" add the directory to 'runtimepath'
"let &runtimepath = printf('%s,%s,%s/after', s:portable, &runtimepath, s:portable)

" enable all features
set nocompatible

filetype on
filetype plugin on
set autoindent
"set smartindent
set tabstop=4
set shiftwidth=4

" show the command you're typing
set showcmd

" show line numbers
"set number

" I want to be able to open another file and background current buffer
set hidden

" enable syntax highlighting
syntax on
set background=dark
set t_Co=256

" always show statusbar
set laststatus=2

" search highlighting
set hlsearch
set incsearch
set ignorecase
set smartcase

" don't use fancy symbols in statusline
let g:Powerline_symbols = "compatible"

noremap <Leader>rg :color relaxedgreen<CR>
noremap <Leader>w :noh<CR>

command Wq wq
command WQ wq
command W w
command Q q
command Bd bd
cnoreabbrev q1 q!
cnoreabbrev b3 b#

map <F1> <Esc>
map gf ;e <cfile><CR>
imap <F1> <Esc>

set title
set scrolloff=1
set foldmethod=indent
set foldlevel=200
set nojoinspaces

syntax sync minlines=500

nnoremap ; :
vnoremap ; :
nnoremap : ;
vnoremap : ;
nnoremap Q <nop>

set mouse=
set pastetoggle=<F10>
set wildignorecase

