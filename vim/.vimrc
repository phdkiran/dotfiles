" .vimrc by Roman Zolotarev

""" Load up pathogen and all bundles
call pathogen#infect()
call pathogen#helptags()

""" Sets
syntax on
filetype plugin indent on
set shell=/usr/local/bin/bash
set encoding=utf-8
set clipboard=unnamed
set pastetoggle=<F2>
set showmode
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
set viminfo='10,\"100,:20,%,n~/.viminfo
set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]
" Highlight trailing spaces in annoying red
highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/
set cursorline
set expandtab
set incsearch
set laststatus=2
set listchars=tab:»·,trail:·,eol:¬
set nocompatible
set nofoldenable
set nowrap
set number
set ruler
set scrolloff=5
set shiftwidth=2
set showmatch
set smartcase
set ts=2
set wildmenu
set wildmode=list:longest,full

""" Commands
command! -nargs=* Wrap set wrap linebreak nolist
command! -nargs=* Nowrap set nowrap

""" Autocmds
autocmd! BufWritePost .vimrc source %
" autocmd FileType litcoffee runtime ftplugin/coffee.vim
autocmd FileType coffee,html,css,scss,sass,js,litcoffee,jade
autocmd BufWritePre * :%s/\s\+$//e
" Neocompletecache
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

""" Colors
set background=dark
colorscheme Tomorrow-Night
let g:airline_powerline_fonts = 1
set colorcolumn=79

""" NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

""" Keyboard Shortcuts
" Leader
let mapleader = ","
inoremap jk <ESC>
nnoremap <F2> :set invpaste paste?<CR>
noremap<C-n> :NERDTreeToggle<CR>
nnoremap<c-\> :Gbrowse<CR>
noremap<leader>. :vsp ~/.vimrc<CR>:vertical res 79<CR>
noremap<leader>l :set list!<CR>
noremap<leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
noremap<leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
noremap<leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
noremap<leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>
noremap<C>n :vsp.
noremap<F5> :setlocal spell! spelllang=en_us<cr>
inoremap<F5> <ESC>:setlocal spell! spelllang=en_us<cr>
nnoremap <silent> <Leader>/ :nohlsearch<CR>
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv
" Disable arrow keys. That's not Emacs, that's why
" nnoremap<left> <nop>
" nnoremap<right> <nop>
" nnoremap<up> <nop>
" nnoremap<down> <nop>
" Windows
noremap<C-h> <C-w>h
noremap<C-j> <C-w>j
noremap<C-k> <C-w>k
noremap<C-l> <C-w>l
" Tabs
nnoremap <leader>m :tabn<CR>
nnoremap <leader>n :tabp<CR>
nnoremap <leader>w :w<CR>
" Unite
nnoremap <leader>D :Unite -start-insert directory<CR>
nnoremap <leader>p :Unite -start-insert history/yank<CR>
nnoremap <leader>g :Unite -silent -start-insert menu:git<CR>
nnoremap <leader>j :Unite -silent -start-insert menu:all menu:git<CR>
" Neocomplcache
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()
" <CR>: close popup and save indent
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" Undo
if has('persistent_undo')
  silent !mkdir ~/.vim/undo > /dev/null 2>&1
  set undofile                  " Save undo's after file closes
  set undodir=~/.vim/undo/
  set undolevels=100            " How many undos
  set undoreload=3000           " Number of lines to save for undo
endif

" Backup
silent !mkdir ~/.vim/swap > /dev/null 2>&1
set backupdir=~/.vim/swap/
set directory=~/.vim/swap/

" Tabularize
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' &&
    (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column =
    strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position =
    strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call
    search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

""" Unite
let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable = 1
let g:unite_split_rule = "botright"

""" Neocomplcache
