" .vimrc by Roman Zolotarev
" http://tools.romanzolotarev.com/vim

"" Global
set nocompatible
" Load up pathogen and all bundles
call pathogen#infect()
call pathogen#helptags()
set shell=/bin/bash
let mapleader = ","

"" Commands
set wildmenu " Use menu for command completion
set wildmode=list:longest,full

"" Search
set ignorecase " Ignore case
set smartcase " Override ignore case when upper case chars are used
set incsearch " Highlight search results
set hlsearch " Highligth search

"" Edit
inoremap jk <ESC>
set clipboard=unnamed " Use system clipboard
set pastetoggle=<F2>
set expandtab " Expand tabs to spaces
set shiftwidth=2
set ts=2
set backspace=indent,eol,start " Backspacing over everything
" You don't have to change keyboard layout to execute Normal mode commands
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

"" Syntax
syntax on " Turn syntax highlight

"" Ruler, cursor, scroll, windows
set cursorline " Highlight current line
set laststatus=2 " Always show status line
set noshowmode " Hide mode, because status line have it already
set ruler " Show column and row number
set scrolloff=5 " Minimum number of lines above and below the cursor
" Switch windows
noremap<C-h> <C-w>h
noremap<C-j> <C-w>j
noremap<C-k> <C-w>k
noremap<C-l> <C-w>l

"" Lines, numbers, wrap
set number
set nowrap
set listchars=tab:»·,trail:·,eol:¬

"" Movements
" Disable arrow keys
nnoremap<left> <nop>
nnoremap<right> <nop>
nnoremap<up> <nop>
nnoremap<down> <nop>

"" Plugins
filetype plugin indent on " Load plugins and indents for file types
autocmd FileType litcoffee runtime ftplugin/coffee.vim " Litcoffee
autocmd vimenter * if !argc() | NERDTree | endif " Open NERDTree on startup
noremap<c-n> :NERDTreeToggle<CR>

"" Git
nnoremap<c-\> :Gbrowse<CR>

"" States
set viminfo='10,\"100,:20,%,n~/.viminfo
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
" Restore cursor position
function! RestoreCursorPositon()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction
augroup restoreCursor
  autocmd!
  autocmd BufWinEnter * call RestoreCursorPositon()
augroup END
" Restore undo history
if has('persistent_undo')
  silent !mkdir ~/.vim/undo > /dev/null 2>&1
  set undofile " Save undo's after file closes
  set undodir=~/.vim/undo/
  set undolevels=100 " How many undos
  set undoreload=3000 " Number of lines to save for undo
endif
" Set swap directory
silent !mkdir ~/.vim/swap > /dev/null 2>&1
set backupdir=~/.vim/swap/
set directory=~/.vim/swap/

nnoremap <leader>m :tabn<CR>
nnoremap <leader>n :tabp<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>D :Unite -start-insert directory<CR>
nnoremap <leader>p :Unite -start-insert history/yank<CR>
nnoremap <leader>g :Unite -silent -start-insert menu:git<CR>
nnoremap <leader>j :Unite -silent -start-insert menu:all menu:git<CR>


" autocmd FileType coffee,html,css,scss,sass,js,litcoffee,jade
autocmd BufWritePre * :%s/\s\+$//e
autocmd! BufWritePost .vimrc source %

set background=dark
let g:airline_powerline_fonts = 1

" Highlight trailing spaces in annoying red
highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/

command! -nargs=* Wrap set wrap linebreak nolist
command! -nargs=* Nowrap set nowrap

set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]
set colorcolumn=79

noremap<leader>. :sp ~/.vimrc<CR>
nnoremap <silent> <Leader>/ :nohlsearch<CR>
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

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

