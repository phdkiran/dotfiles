" .vimrc by Roman Zolotarev
" http://tools.romanzolotarev.com/vim

" Load up pathogen and all bundles
call pathogen#infect()
call pathogen#helptags()
autocmd FileType litcoffee runtime ftplugin/coffee.vim

" set clipboard=unnamed

autocmd vimenter * if !argc() | NERDTree | endif
noremap<C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

nnoremap<c-\> :Gbrowse<CR>
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

set viminfo='10,\"100,:20,%,n~/.viminfo

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

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

if has('persistent_undo')
  silent !mkdir ~/.vim/undo > /dev/null 2>&1
  set undofile                  " Save undo's after file closes
  set undodir=~/.vim/undo/
  set undolevels=100            " How many undos
  set undoreload=3000           " Number of lines to save for undo
endif

silent !mkdir ~/.vim/swap > /dev/null 2>&1
set backupdir=~/.vim/swap/
set directory=~/.vim/swap/

inoremap jk <ESC>
noremap<C-h> <C-w>h
noremap<C-j> <C-w>j
noremap<C-k> <C-w>k
noremap<C-l> <C-w>l
nnoremap <leader>m :tabn<CR>
nnoremap <leader>n :tabp<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>D :Unite -start-insert directory<CR>
nnoremap <leader>p :Unite -start-insert history/yank<CR>
nnoremap <leader>g :Unite -silent -start-insert menu:git<CR>
nnoremap <leader>j :Unite -silent -start-insert menu:all menu:git<CR>

set shell=/bin/bash

" autocmd FileType coffee,html,css,scss,sass,js,litcoffee,jade
autocmd BufWritePre * :%s/\s\+$//e
autocmd! BufWritePost .vimrc source %

set background=dark
let g:airline_powerline_fonts = 1

" Highlight trailing spaces in annoying red
highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/

syntax on
filetype plugin indent on

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

command! -nargs=* Wrap set wrap linebreak nolist
command! -nargs=* Nowrap set nowrap

set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]
set colorcolumn=79

let mapleader = ","
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

" Disable arrow keys. That's not Emacs, that's why.
" nnoremap<left> <nop>
" nnoremap<right> <nop>
" nnoremap<up> <nop>
" nnoremap<down> <nop>

let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable = 1
let g:unite_split_rule = "botright"

set encoding=utf-8

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1

let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  "return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
colorscheme Tomorrow-Night
