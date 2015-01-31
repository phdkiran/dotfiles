" .vimrc by Roman Zolotarev
set nocompatible
set runtimepath+=~/.vim/bundle/neobundle.vim
set runtimepath+=~/.vim/bundle/vimproc.vim/autorun
set runtimepath+=~/.vim/bundle/vimproc.vim/plugin
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'shougo/neobundle.vim'
NeoBundle 'shougo/vimproc.vim', {'build' : {'linux' : 'make', 'mac' : 'make -f make_mac.mak' }}

" NeoBundle '~/Repositories/romanzolotarev/vim-journal'
NeoBundle 'romanzolotarev/vim-journal'

NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'elzr/vim-json'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'jtratner/vim-flavored-markdown'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'lilydjwg/colorizer'
NeoBundle 'shougo/neocomplete'
NeoBundle 'shougo/neosnippet'
NeoBundle 'shougo/neosnippet-snippets'
NeoBundle 'shougo/unite.vim'
NeoBundle 't9md/vim-smalls'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-jdaddy'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-vinegar'
NeoBundle 'wavded/vim-stylus'
NeoBundle 'wikitopian/hardmode'

NeoBundleCheck
call neobundle#end()
filetype plugin indent on
syntax on

try
  colorscheme Tomorrow-Night
catch
  colorscheme default
endtry

highlight ExtraWhitespace ctermbg=white guibg=white
highlight statusline ctermbg=237 guibg=#3a3a3a ctermfg=white guifg=white cterm=NONE gui=NONE
highlight statuslinenc ctermbg=235 guibg=#262626 ctermfg=darkgray guifg=darkgray cterm=NONE gui=NONE
highlight User1 ctermbg=237 guibg=#3a3a3a ctermfg=yellow guifg=yellow
highlight markdownItalic ctermfg=blue guifg=blue
match ExtraWhitespace /\s\+$/

silent !mkdir -p ~/.vim/cache > /dev/null 2>&1
silent !mkdir -p ~/.vim/undo > /dev/null 2>&1

if exists(':Unite')
  call unite#custom_source('file_rec/async,file_mru,file,buffer,grep', 'ignore_pattern', join([ '\.git/', '\.build/', '\.meteor/', 'node_modules/', '\.sass-cache/', '\.gif', '\.png', '\.jpg', '\.jpeg', '\.css', '\.build\.'], '\|'))
  call unite#custom#profile('default', 'context', {'start_insert': 0, 'winheight': 25})
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
  call unite#filters#sorter_default#use(['sorter_rank'])
endif

let g:gitgutter_enabled=1
let g:gitgutter_map_keys=0
let g:mapleader=','
let g:neocomplete#data_directory='~/.vim/cache/neocomplete'
let g:neocomplete#enable_at_startup=1
let g:neocomplete#enable_auto_select=0
let g:neosnippet#data_directory='~/.vim/cache/neosnippet'
let g:smalls_auto_jump=1
let g:smalls_auto_jump_min_input_length=3
let g:smalls_auto_jump_timeout=0.5
let g:smalls_exit_at_notfound=1
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
set encoding=utf-8
set formatoptions+=l
set gdefault
set hidden
set ignorecase smartcase incsearch nohlsearch grepprg=ag
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
set listchars=tab:»·,trail:·,eol:¬
set nowrap textwidth=0 wrapmargin=0 linebreak
set pastetoggle=<F2>
set relativenumber number
set scrolloff=3 sidescrolloff=15 sidescroll=1
set shiftwidth=2 softtabstop=2 tabstop=2 expandtab
set shortmess=AI
set statusline=%*\ %F\ %1*%H%M%R%W%*%=\ %{&ft}\ %l,%c\ %<%P\ "
set ttyfast laststatus=2 ruler showmode noshowcmd
set undodir=~/.vim/undo/ undofile undolevels=1000 undoreload=3000
set viminfo='10,\"100,:20,%,n~/.vim/.viminfo
set wildmenu wildmode=list:longest,full

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
nmap <silent> <Leader>` ysiW`
nmap <silent> <Leader>a <Nop>
nmap <silent> <Leader>b :Unite buffer<CR>
nmap <silent> <Leader>c :Gcommit<CR>i
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
nmap <silent> <Leader>q :call Quit()<CR>
nmap <silent> <Leader>r :GitGutterRevertHunk<CR>
nmap <silent> <Leader>s :call StageOrSave()<CR>
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
nmap <silent> ]pc :call PasteAsCoffee()<CR>
nmap <silent> ]pj :call PasteAsJade()<CR>
nmap <silent> cog :GitGutterLineHighlightsToggle<CR>
nmap <silent> j gj
nmap <silent> k gk
vmap <silent> < <gv
vmap <silent> <Leader>- mmvip:sort<CR>`m
vmap <silent> <Leader>; :Commentary<CR>
vmap <silent> <Leader>n "nd:new<CR>"nP
vmap <silent> > >gv

function! Quit()
  let numberOfListedBuffers = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
  if numberOfListedBuffers > 1
    bprevious
    bdelete #
  else
    if &modified
      echohl WarningMsg | echo "This buffer has unsaved changes. I don't want to quit." | echohl None
    else
      execute ':q'
    endif
  endif
endfunction

if !exists('*StageOrSave')
  function! StageOrSave()
    if &ft == 'gitcommit'
      echohl WarningMsg | echo "Nothing to save." | echohl None
    else
      if exists(':Gstatus')
        GitGutterStageHunk
        GitGutterNextHunk
      else
        w
      endif
    endif
  endfunction
endif

function! PasteAsCoffee()
  read !pbpaste | js2coffee
endfunction

function! PasteAsJade()
  read !pbpaste | html2jade
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
  autocmd BufWritePost .gvimrc source %
  autocmd BufWritePost .vimrc source %
  autocmd FileType coffee setlocal omnifunc=coffeecomplete#Complete
  autocmd FileType coffee,jade setlocal foldmethod=indent nofoldenable
  autocmd FileType css,sass,scss setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType help,gitcommit,netrw setlocal statusline=%1*\ %{toupper(&ft)}
  autocmd FileType html,journal,ghmarkdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd WinEnter * setlocal cursorline colorcolumn=79 relativenumber
  autocmd WinLeave * setlocal nocursorline colorcolumn=0 norelativenumber
augroup END