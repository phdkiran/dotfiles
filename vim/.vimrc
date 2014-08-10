" .vimrc by Roman Zolotarev
" http://tools.romanzolotarev.com/vim

" Initialize Vundle and plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
" My plugins

" Plugin 'Lokaltog/vim-easymotion'
" Plugin 'edkolev/promptline.vim'
" Plugin 'rizzatti/dash.vim'
" Plugin 'rizzatti/funcoo.vim'
" Plugin 'tpope/vim-abolish'
" Plugin 'tpope/vim-liquid'
Plugin 'Shougo/neocomplete'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'Shougo/vimproc'
Plugin 'Slava/vim-spacebars'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'digitaltoad/vim-jade'
Plugin 'elzr/vim-json'
Plugin 'gregsexton/gitv'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'kchmck/vim-coffee-script'
Plugin 'rking/ag.vim'
Plugin 'shougo/unite.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
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
nnoremap <silent> ,z :bp<cr>
nnoremap <silent> ,x :bn<cr>

" Lines, numbers, wrap
set number
set nowrap
set listchars=tab:»·,trail:·,eol:¬
autocmd BufWrite .vimrc :call DeleteTrailingWS()
autocmd BufWrite *.jade :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" Motions
nnoremap j gj
nnoremap k gk
inoremap jk <ESC>
inoremap kk <ESC>
inoremap jj <ESC>
noremap<left> <nop>
noremap<right> <nop>
noremap<up> <nop>
noremap<down> <nop>

" Cursor, scroll, windows
set cursorline
set colorcolumn=79
set scrolloff=5
set sidescrolloff=15
set sidescroll=1

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
set backspace=indent,eol,start " Backspacing over everything
set clipboard=unnamed
set expandtab
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
set pastetoggle=<F2>
set shiftwidth=2
set softtabstop=2
set tabstop=2
vnoremap < <gv
vnoremap > >gv
vnoremap p "_dP
nnoremap ,ow "_diwhp
" ,# Surround a word with #{interpolation}
vnoremap ,# c#{<c-R>"}<ESC>
" ,' Surround a word with single quotes
noremap ,' ysiw'
vnoremap ,' c'<c-R>"'<ESC>
noremap <leader>c :Commentary<cr>
inoremap <leader>c <Esc>:Commentary<cr>i

" Colors
syntax on
set background=dark
if filereadable( expand("$HOME/.vim/bundle/vim-tomorrow-theme/colors/Tomorrow-Night.vim") )
  colorscheme Tomorrow-Night
endif
highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/
let g:vim_json_syntax_conceal = 0
augroup markdown
  autocmd!
  autocmd BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup end

" Git
nnoremap ]c :GitGutterNextHunk<cr>
nnoremap [c :GitGutterPrevHunk<cr>
nnoremap <Leader>hs :GitGutterStageHunk<cr>
nnoremap <Leader>hr :GitGutterRevertHunk<cr>
nnoremap <leader>g :Gstatus<cr>

" Unite
let g:unite_source_history_yank_enable = 1
let g:unite_data_directory='~/.vim/.cache/unite'
let g:unite_source_rec_max_cache_files=5000
let g:unite_enable_start_insert = 1
let g:unite_split_rule = "botright"
let g:unite_force_overwrite_statusline = 0
let g:unite_winheight = 10
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/', '\.build/', '\.meteor/', 'node_modules/', '\.sass-cache/',
      \ '\.gif', '\.png', '\.jpg', '\.jpeg', '\.css'
      \ ], '\|'))
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
nnoremap <space>/ :Unite grep:.<cr>
nnoremap <space>y :Unite history/yank<cr>
nnoremap <c-p> :Unite file_rec/async buffer file_rec<cr>
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  inoremap <buffer> <C-j> <Plug>(unite_select_next_line)
  inoremap <buffer> <C-k> <Plug>(unite_select_previous_line)
  inoremap <silent><buffer><expr> <C-x> unite#do_action('split')
  inoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  inoremap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
  nnoremap <buffer> <ESC> <Plug>(unite_exit)
endfunction

" Neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#sources#dictionary#dictionaries = {
  \ 'default' : '',
  \ 'vimshell' : $HOME.'/.vimshell_hist',
  \ 'scheme' : $HOME.'/.gosh_completions'
  \ }
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
inoremap <silent> <cr> <c-r>=<SID>my_cr_function()<cr>
function! s:my_cr_function()
  return pumvisible() ? neocomplete#close_popup() : "\<cr>"
endfunction
inoremap <expr><tab>  pumvisible() ? "\<c-n>" : "\<tab>"
autocmd FileType coffee setlocal omnifunc=coffeecomplete#Complete
autocmd FileType css,sass,scss setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" Neosnippet
inoremap <c-k> <Plug>(neosnippet_expand_or_jump)
snoremap <c-k> <Plug>(neosnippet_expand_or_jump)
xnoremap <c-k> <Plug>(neosnippet_expand_target)
inoremap <expr><tab> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: pumvisible() ? "\<c-n>" : "\<tab>"
snoremap <expr><tab> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: "\<tab>"
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Open and reload .vimrc
noremap<leader>. :tabnew ~/.vimrc<cr>
autocmd! BufWritePost .vimrc source % | AirlineRefresh

" Turn backup and swap off
set autoread
set nobackup
set noswapfile

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
augroup end

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

