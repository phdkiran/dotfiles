" .vimrc by Roman Zolotarev
" http://tools.romanzolotarev.com/vim

" Initialize Vundle and plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
" My plugins

" Plugin 'Lokaltog/vim-easymotion.git'
" Plugin 'Shougo/neocomplcache.vim.git'
" Plugin 'Slava/vim-spacebars.git'
" Plugin 'digitaltoad/vim-jade.git'
" Plugin 'edkolev/promptline.vim'
" Plugin 'elzr/vim-json.git'
" Plugin 'jelera/vim-javascript-syntax.git'
" Plugin 'mattn/gist-vim.git'
" Plugin 'mintplant/vim-literate-coffeescript'
" Plugin 'othree/html5-syntax.vim.git'
" Plugin 'rizzatti/dash.vim.git'
" Plugin 'rizzatti/funcoo.vim.git'
" Plugin 'tpope/vim-abolish.git'
" Plugin 'tpope/vim-liquid.git'
" Plugin 'tpope/vim-markdown.git'
" Plugin 'tpope/vim-repeat.git'
" Plugin 'vim-scripts/coffee.vim'

Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'kchmck/vim-coffee-script'
Plugin 'shougo/unite.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
call vundle#end()
filetype plugin indent on

let mapleader = ","
set encoding=utf-8
set ttyfast

" Commands
nnoremap <leader>w :call DeleteTrailingWS()<cr> :w<cr>
set wildmenu
set wildmode=list:longest,full

" Switch tabs and windows
nnoremap <leader>m :tabn<cr>
nnoremap <leader>n :tabp<cr>
noremap<c-h> <c-w>h
noremap<c-j> <c-w>j
noremap<c-k> <c-w>k
noremap<c-l> <c-w>l

" Lines, numbers, wrap
set number
set nowrap
set listchars=tab:»·,trail:·,eol:¬
autocmd BufWrite .vimrc :call DeleteTrailingWS()
autocmd BufWrite *.jade :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" Movements
nnoremap j gj
nnoremap k gk
inoremap jk <ESC>
inoremap kkk <ESC>
inoremap jjj <ESC>
noremap<left> <nop>
noremap<right> <nop>
noremap<up> <nop>
noremap<down> <nop>

" Cursor, scroll, windows
set cursorline
set colorcolumn=79
set scrolloff=5
set nobackup
set noswapfile

" Status line
set laststatus=2
set ruler
set showmode
set noshowcmd
if exists(":Gstatus")
  set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]
else
  set statusline=%F%m%r%h%w\ [%l,%c]\ [%L,%p%%]
endif
let g:airline_powerline_fonts = 1

" Search
set gdefault
set ignorecase smartcase
set incsearch nohlsearch

" Edit
set autoindent
set clipboard=unnamed
set pastetoggle=<F2>
set tabstop=2
set shiftwidth=2
set backspace=indent,eol,start " Backspacing over everything
set clipboard=unnamed
set backspace=indent,eol,start " Backspacing over everything
set expandtab
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
set softtabstop=2
set tabstop=2
vnoremap < <gv
vnoremap > >gv

" Colors
syntax on
set background=dark
if filereadable( expand("$HOME/.vim/bundle/vim-tomorrow-theme/colors/Tomorrow-Night.vim") )
  colorscheme Tomorrow-Night
endif
highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/

" Git
nnoremap ]c :GitGutterNextHunk<cr>
nnoremap [c :GitGutterPrevHunk<cr>
nnoremap <Leader>hs :GitGutterStageHunk<cr>
nnoremap <Leader>hr :GitGutterRevertHunk<cr>

" Open and reload .vimrc
noremap<leader>. :tabnew ~/.vimrc<cr>
autocmd! BufWritePost .vimrc source % | AirlineRefresh

" Restore undo history
silent !mkdir ~/.vim/undo > /dev/null 2>&1
set undofile " Save undo tree after file closes
set undodir=~/.vim/undo/
set undolevels=100 " How many undos
set undoreload=3000 " Number of lines to save
set viminfo='10,\"100,:20,%,n~/.vim/.viminfo
"  '10  :  10 previously edited files
"  "100 :  100 lines for each register
"  :20  :  20 lines of command-line history
"  %    :  Saves and restores the buffer list
"  n... :  Where to save the viminfo files

" Restore cursor position
augroup restoreCursor
  autocmd!
  autocmd BufWinEnter * call RestoreCursorPositon()
augroup END

" Helpers

function! DeleteTrailingWS()
  execute "normal mz"
  %s/\s\+$//ge
  execute "normal `z"
endfunction

function! RestoreCursorPositon()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

