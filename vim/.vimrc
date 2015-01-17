" .vimrc by Roman Zolotarev
" https://github.com/romanzolotarev/dotfiles/tree/master/vim
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

NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'

NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-fugitive'

NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'elzr/vim-json'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'jtratner/vim-flavored-markdown'
NeoBundle 'kchmck/vim-coffee-script'
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

let g:gitgutter_enabled=1
let g:gitgutter_map_keys=0
let g:grep_cmd_opts='--line-numbers --noheading'
let g:neocomplete#data_directory='~/.vim/cache/neocomplete'
let g:neocomplete#enable_at_startup=1
let g:neocomplete#enable_auto_select=0
let g:neosnippet#data_directory='~/.vim/cache/neosnippet'
let g:unite_data_directory='~/.vim/cache/unite'
let g:unite_source_grep_command='ag'
let g:unite_source_grep_default_opts='-i --line-numbers --nocolor --nogroup --hidden -S -C4 --ignore ''.git'''
let g:unite_source_grep_recursive_opt=''
let g:unite_source_history_yank_enable=1
let g:vim_json_syntax_conceal=0

call unite#custom_source('file_rec/async,file_mru,file,buffer,grep', 'ignore_pattern', join([ '\.git/', '\.build/', '\.meteor/', 'node_modules/', '\.sass-cache/', '\.gif', '\.png', '\.jpg', '\.jpeg', '\.css'], '\|'))
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

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

let mapleader=','

imap <C-k> <Plug>(neosnippet_expand_or_jump)
imap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap jj <Esc>
inoremap jk <Esc>
inoremap kk <Esc>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
nmap <Leader>" ysiW"
nmap <Leader>' ysiW'
nmap <Leader>- mmvip:sort<CR>`m
nmap <Leader>.g :tabnew ~/.gvimrc<CR>
nmap <Leader>.v :tabnew ~/.vimrc<CR>
nmap <Leader>/ :Unite grep:.<CR>
nmap <Leader>; :Commentary<CR>
nmap <Leader>= gqip
nmap <Leader>` ysiW`
nmap <Leader>a <Nop>
nmap <Leader>b :Unite buffer<CR>
nmap <Leader>d "_diwhp
nmap <Leader>f :Unite -start-insert file_rec/async<CR>
nmap <Leader>g :Gstatus<CR>
nmap <Leader>h <Nop>
nmap <Leader>j <Nop>
nmap <Leader>k <Nop>
nmap <Leader>l :e <C-r>=expand('%:p:h')<CR><CR>
nmap <Leader>p :call PasteAsCoffee()
nmap <Leader>r :GitGutterRevertHunk<CR>
nmap <Leader>s :GitGutterStageHunk<CR>:GitGutterNextHunk<CR>
nmap <Leader>u :Gpush<CR>
nmap <Leader>w :!git add . && git commit -m 'WIP' && git push<CR>
nmap <Leader>y :Unite history/yank<CR>
nmap Q <Nop>
nmap [h :GitGutterPrevHunk<CR>
nmap ]h :GitGutterNextHunk<CR>
nmap cog :GitGutterLineHighlightsToggle<CR>
nnoremap K i<CR><Esc>
nnoremap Y y$
nnoremap j gj
nnoremap k gk
smap <C-k> <Plug>(neosnippet_expand_or_jump)
vmap <Leader>c :Commentary<CR>
xmap <C-k> <Plug>(neosnippet_expand_target)

command! WQ w
command! Wq wq
command! W w
command! Q q

function! PasteAsCoffee()
  read !pbpaste | js2coffee
endfunction

function! Trim()
  let savedCursor = getpos('.')
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

function! UniteSettings()
  nmap <buffer> <ESC> <Plug>(unite_exit)
  imap <buffer> <ESC> <Plug>(unite_exit)
endfunction

augroup Auto
  autocmd!
  autocmd BufWinEnter * call RestoreCursorPositon()
  autocmd BufWrite *.coffee,*.md,.vimrc,*.jade,*.journal :call Trim()
  autocmd BufWrite .vimrc source %
  autocmd BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
  autocmd FileType html,ghmarkdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType coffee,jade setlocal foldmethod=indent nofoldenable
  autocmd FileType coffee setlocal omnifunc=coffeecomplete#Complete
  autocmd FileType css,sass,scss setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType unite call UniteSettings()
augroup END
