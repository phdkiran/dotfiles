" .vimrc by Roman Zolotarev
" http://tools.romanzolotarev.com/vim

" Initialize NeoBundle and plugins
set nocompatible
set runtimepath+=~/.vim/bundle/neobundle.vim
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
" My plugins

"" Maybe, someday
" NeoBundle 'Lokaltog/vim-easymotion'
" NeoBundle 'ap/vim-css-color'
" NeoBundle 'benmills/vimux'
" NeoBundle 'edkolev/promptline.vim'
" NeoBundle 'hail2u/vim-css3-syntax'
" NeoBundle 'pangloss/vim-javascript'
" NeoBundle 'rizzatti/dash.vim'
" NeoBundle 'rizzatti/funcoo.vim'
" NeoBundle 'scrooloose/syntastic'
" NeoBundle 'tpope/vim-cucumber'
" NeoBundle 'wavded/vim-stylus'

"" Learning
NeoBundle 'Keithbsmiley/tmux.vim'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Slava/vim-spacebars'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'bling/vim-airline'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'elzr/vim-json'
NeoBundle 'gregsexton/gitv'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'jtratner/vim-flavored-markdown'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'rking/ag.vim'
NeoBundle 'shougo/unite.vim'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-cucumber'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-repeat'

"" Must have
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'chriskempson/vim-tomorrow-theme'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

let mapleader = ","
set encoding=utf-8
set ttyfast

" Commands
vnoremap <Leader>w :call DeleteTrailingWS()<CR> :w<CR>
nnoremap <Leader>w :call DeleteTrailingWS()<CR> :w<CR>
nnoremap <Leader>q :q<CR>
set wildmenu
set wildmode=list:longest,full

" Switch tabs and windows
nnoremap <Leader>m :tabn<CR>
nnoremap <Leader>n :tabp<CR>
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt
nnoremap <Leader>7 7gt
nnoremap <Leader>8 8gt
nnoremap <Leader>9 9gt
nnoremap <silent> ,z :bp<CR>
nnoremap <silent> ,x :bn<CR>

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
inoremap jk <Esc>
inoremap kk <Esc>
inoremap jj <Esc>
" noremap <Left> <Nop>
" noremap <Right> <Nop>
" noremap <Up> <Nop>
" noremap <Down> <Nop>

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
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;
  \`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
set pastetoggle=<F2>
set shiftwidth=2
set softtabstop=2
set tabstop=2
vnoremap < <gv
vnoremap > >gv
vnoremap p "_dP
nnoremap <Leader>ow "_diwhp
" Surround selected with #{interpolation}
vnoremap <Leader># c#{<C-r>"}<Esc>
" Surround a word with single quotes
nmap <Leader>' ysiw'
" Surround selected with single quotes
vmap <Leader>' c'<C-r>"'<Esc>
" Comment
vnoremap <C-\> :Commentary<CR>
nnoremap <C-\> :Commentary<CR>
inoremap <C-\> <Esc>:Commentary<CR>i
nnoremap crl guiw
nnoremap K i<CR><Esc>
nnoremap <F5> vip:sort<CR>
nmap <C-j> ]e
nmap <C-k> [e
vmap <C-j> ]egv
vmap <C-k> [egv

" Colors
syntax on
set background=dark
if filereadable(
  \ expand("~/.vim/bundle/vim-tomorrow-theme/colors/Tomorrow-Night.vim") )
  colorscheme Tomorrow-Night
endif
highlight ExtraWhitespace ctermbg=7
match ExtraWhitespace /\s\+$/
let g:vim_json_syntax_conceal = 0
augroup markdown
  autocmd!
  autocmd BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup end

" Git
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0
nmap ]h :GitGutterNextHunk<CR>
nmap [h :GitGutterPrevHunk<CR>
nmap <Leader>g :Gstatus<CR>
nmap <Leader>s :GitGutterStageHunk<CR>:GitGutterNextHunk<CR>
nmap <Leader>r :GitGutterRevertHunk<CR>

" Unite
let g:unite_source_history_yank_enable = 1
" let g:unite_force_overwrite_statusline = 0
call unite#custom_source('file_rec/async,file_mru,file,buffer,grep',
  \ 'ignore_pattern', join([
  \ '\.git/', '\.build/', '\.meteor/', 'node_modules/', '\.sass-cache/',
  \ '\.gif', '\.png', '\.jpg', '\.jpeg', '\.css'
  \ ], '\|'))
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
nnoremap <space>/ :Unite -no-split grep:.<CR>
nnoremap <space>y :Unite -no-split history/yank<CR>
nnoremap <C-t> :Unite -no-split buffer<CR>
nnoremap <C-p> :Unite -no-split -start-insert file_rec/async<CR>
autocmd FileType unite call s:UniteSettings()
function! s:UniteSettings()
  highlight ExtraWhitespace ctermbg=8
  imap <buffer> <C-j> <Plug>(unite_select_next_line)
  imap <buffer> <C-k> <Plug>(unite_select_previous_line)
  imap <silent><buffer><expr> <C-x> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  map <silent><buffer><expr> <CR> unite#do_action('tabopen')
  nmap <buffer> <Esc> <Plug>(unite_exit)
  imap <buffer> <Esc> <Plug>(unite_exit)
endfunction

" Neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#sources#dictionary#dictionaries = {
  \ 'default' : '',
  \ 'vimshell' : $HOME.'/.vimshell_hist',
  \ 'scheme' : $HOME.'/.gosh_completions'
  \ }
inoremap <silent> <CR> <C-r>=<SID>MyCrFunction()<CR>
function! s:MyCrFunction()
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
autocmd FileType coffee setlocal omnifunc=coffeecomplete#Complete
autocmd FileType css,sass,scss setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" Neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
imap <expr><Tab> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: pumvisible() ? "\<C-n>" : "\<Tab>"
smap <expr><Tab> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: "\<Tab>"
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Open and reload .vimrc
noremap <Leader>. :tabnew ~/.vimrc<CR>
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
" '10  previously edited files
" "100 lines for each register
" :20  lines of command-line history
" %    saves and restores the buffer list
" n... where to save the viminfo files

" Restore cursor position
augroup restoreCursor
  autocmd!
  autocmd BufWinEnter * call RestoreCursorPositon()
augroup end

" Caches
silent !mkdir ~/.vim/cache > /dev/null 2>&1
let g:neocomplete#data_directory = '~/.vim/cache/neocomplete'
let g:unite_data_directory = '~/.vim/cache/unite'
let g:neosnippet#data_directory = '~/.vim/cache/neosnippet'

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

" TODO
" - Neocomplete
" - Macros vs Snippets
" - Dash snippets
"   - Devtools console
" - Neosnippet
"   - Meteor specific
"   - CoffeeScript
"   - Jade
" - Unite
"   - buffers by name
"   - file by name
"   - Meteor specific directories
" - Find and replace in project
" - Switch tabs by numbers
" - Check search and replace in project
