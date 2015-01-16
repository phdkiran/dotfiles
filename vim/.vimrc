" .vimrc by Roman Zolotarev
" http://tools.romanzolotarev.com/vim

" Initialize NeoBundle and plugins
set nocompatible
set runtimepath+=~/.vim/bundle/neobundle.vim
set runtimepath+=~/.vim/bundle/vimproc.vim/autorun
set runtimepath+=~/.vim/bundle/vimproc.vim/plugin
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim'

" Experimental
" NeoBundle '~/Repositories/romanzolotarev/vim-journal'
NeoBundle 'romanzolotarev/vim-journal'
" Stable
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'elzr/vim-json'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'jtratner/vim-flavored-markdown'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'lilydjwg/colorizer'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'vim-scripts/SyntaxRange'
" Some day
" NeoBundle 'lokaltog/vim-distinguished'
" NeoBundle 'lokaltog/vim-easymotion'
" NeoBundle 'lukaszkorecki/coffeetags'
" NeoBundle 'majutsushi/tagbar'
" NeoBundle 'nathanaelkane/vim-indent-guides'
" NeoBundle 'nelstrom/vim-qargs'
" NeoBundle 'scrooloose/syntastic'
" NeoBundle 'sjl/gundo.vim'
" NeoBundle 'skwp/greplace.vim'
" NeoBundle 'terryma/vim-multiple-cursors'
" NeoBundle 'tomtom/tlib_vim'
" NeoBundle 'tpope/vim-cucumber'
" NeoBundle 'tpope/vim-git'
" NeoBundle 'tpope/vim-repeat'
NeoBundle 'wavded/vim-stylus'
" NeoBundle 'xolox/vim-easytags'
" NeoBundle 'xolox/vim-misc'
" NeoBundle 'xolox/vim-session'
" wincent/Command-T
" tomtom/tcomment_vim
" skwp/greplace.vim
" ervandew/supertab

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

set shortmess=I
let mapleader=','
set encoding=utf-8
set ttyfast

" Commands
inoremap <Leader>w <Esc>:w<CR>i
vnoremap <Leader>w :w<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
set wildmenu
set wildmode=list:longest,full
nnoremap Y y$
nnoremap q: <Nop>
nnoremap Q <Nop>
nnoremap gQ <Nop>
vnoremap <ESC> o<ESC>

" Switch tabs and windows
nnoremap <Leader>m :tabn<CR>
nnoremap <Leader>n :tabp<CR>
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
" noremap <C-l> <C-w>l
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
noremap <Left> :tabp<CR>
noremap <Right> :tabn<CR>
noremap <Up> <C-w>k
noremap <Down> <C-w>j

" Directory Listing
let g:netrw_liststyle=4

" Lines, numbers, wrap
set relativenumber
set wrap
set textwidth=0 wrapmargin=0
set linebreak
set formatoptions+=l
set listchars=tab:»·,trail:·,eol:¬
autocmd BufWrite *.coffee,*.md,.vimrc,*.jade :call DeleteTrailingWS()
autocmd BufNewFile,BufReadPost *.coffee,*.jade setl foldmethod=indent nofoldenable

" Motions
nnoremap j gj
nnoremap k gk
inoremap jk <Esc>
inoremap kk <Esc>
inoremap jj <Esc>
inoremap <C-k> <Up>
inoremap <C-j> <Down>

" Cursor, scroll, windows
set cursorline
set colorcolumn=79
set scrolloff=5
set sidescrolloff=15
set sidescroll=1

" Status line
let g:lightline = {
  \ 'colorscheme': 'Tomorrow_Night',
  \ 'mode_map': { 'c': 'NORMAL' },
  \ 'active': {
  \   'right': [ [ 'line' ], [ 'percent' ], [ 'filetype' ] ],
  \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
  \ },
  \ 'component_function': {
  \   'modified': 'MyModified',
  \   'readonly': 'MyReadOnly',
  \   'fugitive': 'MyFugitive',
  \   'filename': 'MyFilename',
  \   'filetype': 'MyFiletype',
  \   'mode': 'MyMode',
  \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' }
  \ }

function! MyLineinfo()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &lineinfo
endfunction

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadOnly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'X' : ''
endfunction

function! MyFilename()
  return ('' != MyReadOnly() ? MyReadOnly() . ' ' : '') .
    \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
    \  &ft == 'unite' ? unite#get_status_string() :
    \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
    \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? 'X '._ : ''
  endif
  return ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : '') : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

set laststatus=2
set ruler
set noshowmode
set noshowcmd
if exists(":Gstatus")
  set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]
else
  set statusline=%F%m%r%h%w\ [%l,%c]\ [%L,%p%%]
endif

" Search
set gdefault
set ignorecase smartcase
set incsearch nohlsearch
set grepprg=ag
let g:grep_cmd_opts='--line-numbers --noheading'

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
" Surround a Word with quotes
nmap <Leader>' ysiW'
nmap <Leader>" ysiW"
nmap <Leader>` ysiW`
" Surround selected with single quotes
vmap <Leader>' c'<C-r>"'<Esc>
" Comment
vnoremap <C-\> :Commentary<CR>gv
nnoremap <C-\> :Commentary<CR>
inoremap <C-\> <Esc>:Commentary<CR>i
nnoremap crl guiw
nnoremap K i<CR><Esc>
nmap <C-j> ]e
nmap <C-k> [e
vmap <C-j> ]egv
vmap <C-k> [egv
noremap <Leader>a <Esc>ggVG

" Sort and format
nnoremap <Leader>= gqip
nnoremap <Leader>s vip:sort<CR>

" Colors
syntax on
set background=dark
if filereadable(
  \ expand("~/.vim/bundle/vim-tomorrow-theme/colors/Tomorrow-Night.vim") )
  colorscheme Tomorrow-Night
endif
highlight ExtraWhitespace ctermbg=7
match ExtraWhitespace /\s\+$/
let g:vim_json_syntax_conceal=0
hi markdownItalic guifg=#de935f
augroup markdown
  autocmd!
  autocmd BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup end
let g:indent_guides_auto_colors=0
hi IndentGuidesOdd ctermbg=0
hi IndentGuidesEven ctermbg=8

" js2coffee
function! PasteAsCoffee()
  :read !pbpaste | js2coffee
endfunction
:command! PasteAsCoffee :call PasteAsCoffee()

" Git
let g:gitgutter_enabled=1
let g:gitgutter_map_keys=0
nmap ]h :GitGutterNextHunk<CR>
nmap [h :GitGutterPrevHunk<CR>
nmap <Leader>p :Gpush<CR>
nmap <Leader>g :Gstatus<CR>
nmap <Leader>s :GitGutterStageHunk<CR>:GitGutterNextHunk<CR>
nmap <Leader>r :GitGutterRevertHunk<CR>

" ctags
" let g:easytags_dynamic_files=1
" let g:easytags_events=['BufWritePost']
" let g:CoffeeAutoTagDisabled=0
" let g:CoffeeAutoTagFile='.git/tags'
" let g:CoffeeAutoTagIncludeVars=1
" let g:CoffeeAutoTagTagRelative=0

" VimFiler
" let g:vimfiler_as_default_explorer = 1
let g:vimfiler_tree_leaf_icon=''
let g:vimfiler_force_overwrite_statusline=0
noremap <silent> <Leader>f :VimFiler -buffer-name=filer -auto-expand -split -simple -winwidth=35 -toggle -no-quit<CR>
noremap <silent> <Leader>a :VimFilerBufferDir -buffer-name=filer -auto-expand -split -simple -winwidth=35 -toggle -find<CR>

autocmd BufEnter * if (winnr('$') == 1 && &filetype ==# 'vimfiler') | q | endif

" Unite
let g:unite_source_history_yank_enable=1
let g:unite_force_overwrite_statusline=0
if executable('ag')
  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='-i --line-numbers --nocolor --nogroup --hidden -S -C4 --ignore ''.git'''
  let g:unite_source_grep_recursive_opt=''
endif
call unite#custom_source('file_rec/async,file_mru,file,buffer,grep',
  \ 'ignore_pattern', join([
  \ '\.git/', '\.build/', '\.meteor/', 'node_modules/', '\.sass-cache/',
  \ '\.gif', '\.png', '\.jpg', '\.jpeg', '\.css'
  \ ], '\|'))
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
nnoremap <Leader>/ :Unite grep:.<CR>
nnoremap <Leader>y :Unite history/yank<CR>
nnoremap <Leader>b :Unite buffer<CR>
nnoremap <C-p> :Unite -start-insert file_rec/async<CR>

" Neocomplete
let g:neocomplete#enable_at_startup=1
let g:neocomplete#enable_auto_select=0
let g:neocomplete#sources#dictionary#dictionaries={
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
  let g:neocomplete#sources#omni#input_patterns={}
endif

" Neosnippet
let g:neosnippet#disable_select_mode_mappings=1
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

" Open frequently used files
noremap <Leader>.n :tabnew ~/Dropbox/Notes<CR>
" Open and reload .vimrc
noremap <Leader>.v :tabnew ~/.vimrc<CR>
autocmd! BufWritePost .vimrc source %

" Turn backup and swap off
set autoread
set nobackup
set noswapfile
set nowritebackup

" Encryption
set cryptmethod=blowfish

" Sessions
let g:session_directory="~/.vim/session"
let g:session_autoload="no"
let g:session_autosave="no"
let g:session_command_aliases=1
nnoremap <F3> :OpenSession
nnoremap <F2> :SaveSession
nnoremap <F8> :DeleteSession<CR>
nnoremap <F4> :CloseSession<CR>

" Restore undo history
silent !mkdir ~/.vim/undo > /dev/null 2>&1
nnoremap <Leader>u :GundoToggle<CR>
set undofile " Save undo tree after file closes
set undodir=~/.vim/undo/
set undolevels=1000 " How many undos
set undoreload=3000 " Number of lines to save
set viminfo='10,\"100,:20,%,n~/.vim/.viminfo
" '10  previously edited files
" "100 lines for each register
" :20  lines of command-line history
" %    Saves and restores the buffer list
" n... Where to save the viminfo files

" Restore cursor position
augroup restoreCursor
  autocmd!
  autocmd BufWinEnter * call RestoreCursorPositon()
augroup end

" Caches
silent !mkdir ~/.vim/cache > /dev/null 2>&1
let g:neocomplete#data_directory='~/.vim/cache/neocomplete'
let g:unite_data_directory='~/.vim/cache/unite'
let g:neosnippet#data_directory='~/.vim/cache/neosnippet'

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

" vmap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
" map <Leader>nt :e! ~/Dropbox/docs/trailmix/todo.md<cr>
" map <Leader>nn :sp ~/Dropbox/notes/programming_notes.txt<cr>
" map <Leader>pn :sp ~/Dropbox/work/thoughtbot/notes/project-notes.txt<cr>

" map <Leader>rf :CommandTFlush<CR>:CommandT<CR>
" map <Leader>ra :%s/
" map <Leader>l oconsole.log 'Debugging'<ESC>:w<CR>
" map <Leader>i mmgg=G`m<CR>
" map <Leader>h :CommandT<CR>
" map <Leader>fix :cnoremap % %<CR>
" map <Leader>gw :!git add . && git commit -m 'WIP' && git push<cr>
" map <Leader>ec :e ~/code/
" map <Leader>dr :e ~/Dropbox<cr>
" map <Leader>dj :e ~/Dropbox/notes/debugging_journal.txt<cr>
" map <Leader>cn :e ~/Dropbox/notes/coding-notes.txt<cr>
" map <Leader>co ggVG"*y
" map <Leader>cu :Tabularize /\|<CR>
" nmap <Leader>bi :source ~/.vimrc<cr>:PluginInstall<cr>

