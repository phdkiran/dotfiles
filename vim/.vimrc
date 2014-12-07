" .vimrc by Roman Zolotarev
" http://tools.romanzolotarev.com/vim

" Initialize NeoBundle and plugins
set nocompatible
set runtimepath+=~/.vim/bundle/neobundle.vim
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'shougo/neobundle.vim'
NeoBundle 'shougo/vimproc', {
  \ 'build' : {
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }

" Experimental
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'rizzatti/dash.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'shougo/unite.vim'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-session'
NeoBundle 'skwp/greplace.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'wavded/vim-stylus'
NeoBundle 'lilydjwg/colorizer'
" NeoBundle 'nelstrom/vim-qargs'
" NeoBundle 'chrisbra/csv.vim'

" Must have
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'elzr/vim-json'
NeoBundle 'gregsexton/gitv'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'jtratner/vim-flavored-markdown'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'keithbsmiley/tmux.vim'
NeoBundle 'romanzolotarev/vim-todo'
NeoBundle 'shougo/neocomplete'
NeoBundle 'shougo/neosnippet'
NeoBundle 'shougo/neosnippet-snippets'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'

" Some day
" NeoBundle 'ap/vim-css-color'
" NeoBundle 'benmills/vimux'
" NeoBundle 'cmather/vim-meteor-snippets'
" NeoBundle 'edkolev/promptline.vim'
" NeoBundle 'groenewege/vim-less'
" NeoBundle 'lokaltog/vim-distinguished'
" NeoBundle 'lokaltog/vim-easymotion'
" NeoBundle 'marcWeber/vim-addon-mw-utils'
" NeoBundle 'pangloss/vim-javascript'
" NeoBundle 'skammer/vim-css-color'
" NeoBundle 'slava/vim-spacebars'
" NeoBundle 'tomtom/tlib_vim'
" NeoBundle 'tpope/vim-cucumber'
" NeoBundle 'tpope/vim-git'
" NeoBundle 'wavded/vim-stylus'

" NeoBundle 'lukaszkorecki/coffeetags'
" NeoBundle 'xolox/vim-easytags'
" NeoBundle 'xolox/vim-misc'
" NeoBundle 'majutsushi/tagbar'
call neobundle#end()
filetype plugin indent on
NeoBundleCheck

set shortmess=I
let mapleader=","
set encoding=utf-8
set ttyfast

" Commands
inoremap <Leader>w <Esc>:w<CR>i
vnoremap <Leader>w :w<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
set wildmenu
set wildmode=list:longest,full

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
let g:netrw_liststyle=3

" Lines, numbers, wrap
set number
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
set laststatus=2
set ruler
set showmode
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

" Dash
nmap <silent> <leader>d <Plug>DashSearch

" Open frequiently used files
noremap <Leader>.n :tabnew ~/Dropbox/Notes<CR>
" Open and reload .vimrc
noremap <Leader>.v :tabnew ~/.vimrc<CR>
autocmd! BufWritePost .vimrc source %

" Turn backup and swap off
set autoread
set nobackup
set noswapfile

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

" TODO
" - Check search and replace in project
" - Macros vs Snippets vs Abbr
" - Neocomplete Tab vs Enter
" - Neosnippet + Multiple Cursors
" - Unite + Ag
" - Add keyboard shortcuts
"   - :PasteAsCoffee
