" .vimrc by Roman Zolotarev
set nocompatible
set runtimepath+=~/.vim/bundle/neobundle.vim
set runtimepath+=~/.vim/bundle/vimproc.vim/autorun
set runtimepath+=~/.vim/bundle/vimproc.vim/plugin
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim'

" NeoBundle '~/Repositories/romanzolotarev/vim-journal'
NeoBundle 'romanzolotarev/vim-journal'

NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'elzr/vim-json'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'jtratner/vim-flavored-markdown'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'lilydjwg/colorizer'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'wavded/vim-stylus'

call neobundle#end()
filetype plugin indent on
syntax on

colorscheme Tomorrow-Night
highlight ExtraWhitespace ctermbg=7
highlight markdownItalic ctermfg=4
match ExtraWhitespace /\s\+$/

silent !mkdir -p ~/.vim/cache > /dev/null 2>&1
silent !mkdir -p ~/.vim/undo > /dev/null 2>&1

call unite#custom_source('file_rec/async,file_mru,file,buffer,grep', 'ignore_pattern', join([ '\.git/', '\.build/', '\.meteor/', 'node_modules/', '\.sass-cache/', '\.gif', '\.png', '\.jpg', '\.jpeg', '\.css', '\.build\.'], '\|'))
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
let g:gitgutter_enabled=1
let g:gitgutter_map_keys=0
let g:neocomplete#data_directory='~/.vim/cache/neocomplete'
let g:neocomplete#enable_at_startup=1
let g:neocomplete#enable_auto_select=0
let g:neosnippet#data_directory='~/.vim/cache/neosnippet'
let g:unite_data_directory='~/.vim/cache/unite'
let g:unite_source_grep_command='ag'
let g:unite_source_grep_default_opts='--smart-case -i --line-numbers --nocolor --nogroup --hidden -S --ignore ''.git'''
let g:unite_source_grep_recursive_opt=''
let g:unite_source_history_yank_enable=1
let g:vim_json_syntax_conceal=0
let mapleader=','
set autoindent
set autoread nobackup noswapfile nowritebackup
set backspace=indent,eol,start
set clipboard=unnamed
set cryptmethod=blowfish
set cursorline colorcolumn=79
set encoding=utf-8
set formatoptions+=l
set gdefault
set ignorecase smartcase incsearch nohlsearch grepprg=ag
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
set listchars=tab:»·,trail:·,eol:¬
set nowrap textwidth=0 wrapmargin=0 linebreak
set pastetoggle=<F2>
set relativenumber number
set scrolloff=3 sidescrolloff=15 sidescroll=1
set shiftwidth=2 softtabstop=2 tabstop=2 expandtab
set shortmess=AITstW
set ttyfast laststatus=0 ruler showmode noshowcmd
set undodir=~/.vim/undo/ undofile undolevels=1000 undoreload=3000
set viminfo='10,\"100,:20,%,n~/.vim/.viminfo
set wildmenu wildmode=list:longest,full

command! Q q
command! W w
command! WQ w
command! Wq wq

imap <silent> <C-k> <Plug>(neosnippet_expand_or_jump)
imap <silent> <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
imap <silent> jj <Esc>
imap <silent> jk <Esc>
imap <silent> kk <Esc>
map <silent> <Down> <Nop>
map <silent> <Left> <Nop>
map <silent> <Right> <Nop>
map <silent> <Up> <Nop>
nmap <silent> <C-d> :q<CR>
nmap <silent> <Leader>" ysiW"
nmap <silent> <Leader>' ysiW'
nmap <silent> <Leader>- mmvip:sort<CR>`m
nmap <silent> <Leader>/ :Unite grep:.<CR>
nmap <silent> <Leader>; :Commentary<CR>
nmap <silent> <Leader>= gqip
nmap <silent> <Leader>` ysiW`
nmap <silent> <Leader>a <Nop>
nmap <silent> <Leader>b :Unite buffer<CR>
nmap <silent> <Leader>c :Gcommit<CR>
nmap <silent> <Leader>d eb4li-<Esc>3li-<Esc>ll
nmap <silent> <Leader>f :Unite -start-insert file_rec/async<CR>
nmap <silent> <Leader>g :Gstatus<CR>
nmap <silent> <Leader>h :tabnext<CR>
nmap <silent> <Leader>j :tabprevious<CR>
nmap <silent> <Leader>k !git add . && git commit -m 'WIP' && git push<CR>
nmap <silent> <Leader>l !git log<CR>
nmap <silent> <Leader>m :tabnew ~/.gvimrc<CR>
nmap <silent> <Leader>p :Gpull<CR>
nmap <silent> <Leader>po :Gpush<CR>
nmap <silent> <Leader>r :GitGutterRevertHunk<CR>
nmap <silent> <Leader>s :GitGutterStageHunk<CR>:GitGutterNextHunk<CR>
nmap <silent> <Leader>t :call Trim()<CR>
nmap <silent> <Leader>v :tabnew ~/.vimrc<CR>
nmap <silent> <Leader>w :w<CR>
nmap <silent> <Leader>y :Unite history/yank<CR>
nmap <silent> K i<CR><Esc>
nmap <silent> Q <Nop>
nmap <silent> Y y$
nmap <silent> [h :GitGutterPrevHunk<CR>
nmap <silent> [pc :call PasteAsCoffee()<CR>
nmap <silent> ]h :GitGutterNextHunk<CR>
nmap <silent> cog :GitGutterLineHighlightsToggle<CR>
nmap <silent> j gj
nmap <silent> k gk
smap <silent> <C-k> <Plug>(neosnippet_expand_or_jump)
vmap <silent> <Leader>; :Commentary<CR>
xmap <silent> <C-k> <Plug>(neosnippet_expand_target)

function! PasteAsCoffee()
  read !pbpaste | js2coffee
endfunction

function! Trim()
  let savedCursor = getpos('.')
  retab
  %s/\s\+$//ge
  %s/\($\n\s*\)\+\%$//e
  call setpos('.', savedCursor)
endfunction

function! RestoreCursorPositon()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup Auto
  autocmd!
  autocmd BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
  autocmd BufWinEnter * call RestoreCursorPositon()
  autocmd BufWrite *.coffee,*.md,.vimrc,*.jade,*.journal call Trim()
  autocmd BufWrite .vimrc source %
  autocmd FileType coffee setlocal omnifunc=coffeecomplete#Complete
  autocmd FileType coffee,jade setlocal foldmethod=indent nofoldenable
  autocmd FileType css,sass,scss setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,ghmarkdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
augroup END
