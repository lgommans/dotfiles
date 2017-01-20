" set default 'runtimepath' (without ~/.vim folders)
let &runtimepath = printf('%s/vimfiles,%s,%s/vimfiles/after', $VIM, $VIMRUNTIME, $VIM)

" what is the name of the directory containing this file?
let s:portable = expand('<sfile>:p:h')

" add the directory to 'runtimepath'
let &runtimepath = printf('%s,%s,%s/after', s:portable, &runtimepath, s:portable)

" enable all features
set nocompatible

filetype on
filetype plugin on
set autoindent
set smartindent
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
noremap <Leader>ip :color inkpot<CR>
noremap <Leader>ir :color ir_black<CR>

if has('gui_running')
  colors inkpot
  if has('gui_gtk2') || has('gui_gtk') || has('gui_gnome') || has('gui_photon') 
    set columns=150 lines=83
    set guifont=Monospace\ 10
  elseif has('gui_kde')
    set guifont=Courier\ New/11/-1/5/50/0/0/0/1/0
  elseif has('x11')
    set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
  elseif has('gui_win32')
    set guifont=Luxi_Mono:h12:cANSI
  else
    set guifont=Monospace\ 10
  endif
  "  autocmd VimEnter * NERDTree
  autocmd VimEnter * wincmd p
else
  "colors ir_black
  " runtime .vim/colors/inkpot.vim
  " colors inkpot
  set t_Co=256
endif

command Wq wq
command WQ wq
command W w
command Q q

map <F1> <Esc>
map gf :e <cfile><CR>
imap <F1> <Esc>

set title
set scrolloff=1
set foldmethod=indent
set foldlevel=200

nnoremap Q <nop>

