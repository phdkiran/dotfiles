set nocompatible
set runtimepath+=~/.vim/bundle/neobundle.vim
set runtimepath+=~/.vim/bundle/vimproc.vim/autorun
set runtimepath+=~/.vim/bundle/vimproc.vim/plugin
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'shougo/neobundle.vim'
NeoBundle 'shougo/vimproc.vim'

" NeoBundle '~/Repositories/romanzolotarev/vim-journal'
NeoBundle 'romanzolotarev/vim-snippets'
NeoBundle 'romanzolotarev/vim-journal'
NeoBundle 'tpope/vim-jdaddy'
NeoBundle 'justinmk/vim-sneak'
NeoBundle 'wikitopian/hardmode'

NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'elzr/vim-json'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'jtratner/vim-flavored-markdown'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'shougo/neocomplete'
NeoBundle 'shougo/neosnippet'
NeoBundle 'shougo/neosnippet-snippets'
NeoBundle 'shougo/unite.vim'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-vinegar'
NeoBundle 'wavded/vim-stylus'

NeoBundleCheck
call neobundle#end()
filetype plugin indent on
silent !mkdir -p ~/.vim/undo > /dev/null 2>&1

if !empty(glob('~/.vim/bundle/base16-vim/colors/base16-tomorrow.vim'))
  try
    colorscheme base16-tomorrow
    set background=dark
    syntax on
  catch
    " Plugin 'chriskempson/base16-vim' is inactive
  endtry
endif

if !empty(glob('~/.vim/bundle/unite.vim/autoload/unite.vim'))
  try
    call unite#custom#source('buffer,grep,file_rec/async', 'ignore_pattern', join([ '\.git/', '\.build/', '\.meteor/', 'node_modules/', '\.sass-cache/', '\.gif', '\.png', '\.jpg', '\.jpeg', '\.css', '\.build\.'], '\|'))
    call unite#custom#source('buffer,grep,file_rec/async', 'matchers', ['converter_relative_word', 'matcher_fuzzy', 'matcher_project_ignore_files'])
    call unite#filters#sorter_default#use(['sorter_rank'])
  catch
    " Plugin 'shougo/unite.vim' is inactive
  endtry
endif

let g:gitgutter_enabled=1
let g:gitgutter_map_keys=0
let g:mapleader=','
let g:neocomplete#data_directory='~/.vim/cache/neocomplete'
let g:neocomplete#enable_at_startup=1
let g:neocomplete#enable_auto_select=0
let g:neosnippet#data_directory='~/.vim/cache/neosnippet'
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
let g:netrw_liststyle=3
let g:netrw_menu=0
let g:netrw_preview=1
let g:sneak#streak = 1
let g:unite_data_directory='~/.vim/cache/unite'
let g:unite_source_grep_command='ag'
let g:unite_source_grep_default_opts='--smart-case -i --line-numbers --nocolor --nogroup --hidden -S --ignore ''.git'''
let g:unite_source_grep_recursive_opt=''
let g:unite_source_history_yank_enable=1
let g:vim_json_syntax_conceal=0

set autoindent
set autoread nobackup noswapfile nowritebackup
set backspace=indent,eol,start
set clipboard=unnamed
set cryptmethod=blowfish
set cursorline colorcolumn=79 relativenumber number
set encoding=utf-8
set formatoptions+=l
set gdefault
set hidden
set ignorecase smartcase incsearch nohlsearch grepprg=ag
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
set listchars=tab:»·,trail:·,eol:¬
set nowrap textwidth=0 wrapmargin=0 linebreak
set scrolloff=3 sidescrolloff=15 sidescroll=1
set shiftwidth=2 softtabstop=2 tabstop=2 expandtab
set shortmess=AIWta
set statusline=%*\ %F\ %1*%H%M%R%W%*%=\ %l,%c\ %<%P\ "
set ttyfast laststatus=2 noruler showmode noshowcmd
set undodir=~/.vim/undo/ undofile undolevels=1000 undoreload=3000
set viminfo='10,\"100,:20,%,n~/.vim/.viminfo
set wildmenu wildmode=list:longest,full
set winwidth=85 winheight=3 winminheight=3 winheight=100

command! Q q
command! W w
command! WQ w
command! Wq wq

imap <silent> <C-K> <Plug>(neosnippet_expand_or_jump)
imap <silent> <expr><Tab> pumvisible() ? "\<C-N>" : "\<Tab>"
imap <silent> jj <Esc>
imap <silent> jk <Esc>
imap <silent> kk <Esc>
map <silent> <Down> <Nop>
map <silent> <Left> <Nop>
map <silent> <Right> <Nop>
map <silent> <Up> <Nop>
nmap <silent> <Leader>" ysiW"
nmap <silent> <Leader>' ysiW'
nmap <silent> <Leader>- mmvip:sort<CR>`m
nmap <silent> <Leader>. <Plug>(smalls)
nmap <silent> <Leader>/ :Unite -start-insert grep:.<CR>
nmap <silent> <Leader>9 mmF(r f)r `m
nmap <silent> <Leader>; :Commentary<CR>
nmap <silent> <Leader>= gqip
nmap <silent> <Leader>\ :lcd %:p:h<CR>:pwd<CR>
nmap <silent> <Leader>` ysiW`
nmap <silent> <Leader>a <Nop>
nmap <silent> <Leader>b :Unite buffer<CR>
nmap <silent> <Leader>c :let @c=expand('%p')<CR>:Gcommit<CR>iUpdate <Esc>"cp
nmap <silent> <Leader>d eb4li-<Esc>3li-<Esc>ll
nmap <silent> <Leader>e :edit .<CR>
nmap <silent> <Leader>f :Unite -start-insert file_rec/async<CR>
nmap <silent> <Leader>g :Gstatus<CR>
nmap <silent> <Leader>h :bnext<CR>
nmap <silent> <Leader>j :bprevious<CR>
nmap <silent> <Leader>k <Nop>
nmap <silent> <Leader>l :!git l<CR>
nmap <silent> <Leader>m :edit ~/.gvimrc<CR>
nmap <silent> <Leader>n :new<CR>
nmap <silent> <Leader>p :Gpull<CR>
nmap <silent> <Leader>po :Gpush<CR>
nmap <silent> <Leader>q :q<CR>
nmap <silent> <Leader>r :GitGutterRevertHunk<CR>
nmap <silent> <Leader>s :GitGutterStageHunk<CR>:GitGutterNextHunk<CR>
nmap <silent> <Leader>t :call Trim()<CR>
nmap <silent> <Leader>v :edit ~/.vimrc<CR>
nmap <silent> <Leader>w :w<CR>
nmap <silent> <Leader>y :Unite history/yank<CR>
nmap <silent> <Tab>l "lyiWoconsole.log <C-R>l, '<C-R>l'<Esc>mm{j"lyiW`ma, '<C-R>l'<Esc>:w<CR>
nmap <silent> K i<CR><Esc>
nmap <silent> Q <Nop>
nmap <silent> Y y$
nmap <silent> [h :GitGutterPrevHunk<CR>
nmap <silent> ]h :GitGutterNextHunk<CR>
nmap <silent> ]pc :read !pbpaste <BAR> js2coffee<CR>
nmap <silent> ]pj :read !pbpaste <BAR> html2jade<CR>
nmap <silent> cog :GitGutterLineHighlightsToggle<CR>
nmap <silent> j gj
nmap <silent> k gk
vmap <silent> < <gv
vmap <silent> <Leader>- mmvip:sort<CR>`m
vmap <silent> <Leader>; :Commentary<CR>
vmap <silent> <Leader>n "nd:new<CR>"nP
vmap <silent> > >gv

function! Trim()
  let pos = getpos('.')
  retab
  %s/\s\+$//ge
  %s/\($\n\s*\)\+\%$//e
  call setpos('.', pos)
endfunction

function! RestoreCursorPositon()
  try
    normal! g`"
  catch
    " A mark isn't set
  endtry
endfunction

augroup Auto
  autocmd!
  autocmd BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
  autocmd BufWinEnter * call RestoreCursorPositon()
  autocmd BufWrite *vimrc,*.coffee,*.styl,*.jade,*.md,*.journal call Trim()
  autocmd BufWritePost *gvimrc source %
  autocmd BufWritePost *vimrc source %
  autocmd FileType coffee setlocal omnifunc=coffeecomplete#Complete
  autocmd FileType coffee,jade setlocal foldmethod=indent nofoldenable
  autocmd FileType html,journal,ghmarkdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType journal setlocal colorcolumn=140
  autocmd FileType netrw,help,gitcommit setlocal statusline=\ %{toupper(&filetype)} nocursorline colorcolumn=0 norelativenumber
  autocmd FileType stylus setlocal omnifunc=csscomplete#CompleteCSS
  autocmd WinEnter * setlocal relativenumber number
  autocmd WinLeave * setlocal norelativenumber nonumber
augroup END
