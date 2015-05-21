set nocompatible
set runtimepath+=~/.vim/bundle/neobundle.vim
set runtimepath+=~/.vim/bundle/vimproc.vim/autorun
set runtimepath+=~/.vim/bundle/vimproc.vim/plugin
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'shougo/neobundle.vim'
NeoBundle 'shougo/vimproc.vim', {'build': {'mac': 'make -f make_mac.mak', 'linux': 'make', 'unix': 'gmake'}}

" NeoBundle '~/Repositories/romanzolotarev/vim-journal'
NeoBundle 'romanzolotarev/vim-journal'
NeoBundle 'romanzolotarev/vim-snippets'

" NeoBundle 'claco/jasmine.vim'
" NeoBundle 'gorodinskiy/vim-coloresque'
" NeoBundle 'jeetsukumaran/vim-indentwise'
" NeoBundle 'jelera/vim-javascript-syntax'
" NeoBundle 'reedes/vim-pencil'
" NeoBundle 'shougo/vimfiler'
" NeoBundle 'wavded/vim-stylus'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'elzr/vim-json'
NeoBundle 'jtratner/vim-flavored-markdown'
NeoBundle 'justinmk/vim-dirvish'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'shougo/neocomplete'
NeoBundle 'shougo/neosnippet'
NeoBundle 'shougo/neosnippet-snippets'
NeoBundle 'shougo/unite.vim'
NeoBundle 'skwp/greplace.vim'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-jdaddy'
NeoBundle 'tpope/vim-projectionist'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tsukkee/unite-tag'

NeoBundleCheck
call neobundle#end()
filetype plugin indent on
silent !mkdir -p ~/.vim/undo > /dev/null 2>&1

if !empty(glob('~/.vim/bundle/base16-vim/colors/base16-tomorrow.vim'))
  try
    colorscheme base16-tomorrow
    set background=dark
    syntax on
    highlight uniteStatusHead ctermbg=11 guibg=#373b41
    highlight uniteStatusLineNR ctermbg=11 guibg=#373b41
    highlight uniteStatusSourceNames ctermbg=11 guibg=#373b41
    highlight uniteStatusSourceCandidates ctermbg=11 ctermfg=3 guibg=#373b41
    highlight uniteStatusMessage ctermbg=11 guibg=#373b41
    highlight MatchParen ctermbg=10 ctermfg=3 guibg=#282a2e guifg=#f0c674
    highlight User1 ctermbg=11 guibg=#373b41 ctermfg=3 guifg=#f0c674
    highlight Search ctermfg=3 guifg=#f0c674 ctermbg=11 guibg=#373b41 cterm=underline gui=underline
  catch
    " Plugin 'chriskempson/base16-vim' is inactive
  endtry
endif

if !empty(glob('~/.vim/bundle/unite.vim/autoload/unite.vim'))
  try
    call unite#custom#source('buffer,grep,file_rec/async', 'ignore_pattern', join([ '\.git/', '\.build/', '\.meteor/', 'node_modules/', '\.sass-cache/', 'doc/', '_site/', '\.gif', '\.png', '\.jpg', '\.jpeg', '\.css', '\.build\.'], '\|'))
    call unite#custom#source('buffer,grep,file_rec/async', 'matchers', ['converter_relative_word', 'matcher_fuzzy'])
    " call unite#custom#source('buffer,grep,file_rec/async', 'matchers', ['converter_relative_word'])
    call unite#filters#sorter_default#use(['sorter_rank'])
  catch
    " Plugin 'shougo/unite.vim' is inactive
  endtry
endif

let g:gitgutter_enabled=1
let g:gitgutter_map_keys=0
let g:grep_cmd_opts='--line-numbers --noheading'
let g:neocomplete#data_directory='~/.vim/cache/neocomplete'
let g:neocomplete#enable_at_startup=1
let g:neocomplete#enable_auto_select=0
let g:neosnippet#data_directory='~/.vim/cache/neosnippet'
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_localrmdir='rm -r'
let g:netrw_menu=0
let g:netrw_preview=1
let g:sh_noisk=1
let g:sneak#streak=1
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=1
let g:syntastic_coffee_coffeelint_args="--file ~/.lints/coffeescript.json"
let g:syntastic_loc_list_height=5
let g:syntastic_stl_format='%E{ %fe #%e }%B{ }%W{%fw #%w }'
let g:unite_data_directory='~/.vim/cache/unite'
let g:unite_source_grep_command='ag'
let g:unite_source_grep_default_opts='--smart-case -i --line-numbers --nocolor --nogroup --hidden -S --ignore ''.git'''
let g:unite_source_grep_recursive_opt=''
let g:unite_source_history_yank_enable=1
let g:vim_json_syntax_conceal=0

set autoindent
set autoread nobackup noswapfile nowritebackup
set backspace=start,indent,eol
set clipboard=unnamed
set cmdheight=2
set cryptmethod=blowfish
set cursorline "relativenumber number
set encoding=utf-8
set foldlevel=99
set formatoptions+=l
set gdefault
set hidden
set ignorecase smartcase incsearch nohlsearch grepprg=ag
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
set listchars=tab:»·,trail:·,eol:¬
set modeline
set modelines=3
set nowrap textwidth=0 wrapmargin=0 linebreak
set scrolloff=3 sidescrolloff=15 sidescroll=1
set shiftwidth=2 softtabstop=2 tabstop=2 expandtab shiftround
set shortmess=AIWta
set spellfile=~/.vim/spell/en.utf-8.add,~/.vim/spell/off.utf-8.add
set timeout timeoutlen=1000 ttimeoutlen=100
set ttyfast laststatus=2 noruler showmode noshowcmd
set undodir=~/.vim/undo/ undofile undolevels=1000 undoreload=3000
set viminfo='10,\"100,:20,%,n~/.vim/.viminfo
set wildmenu wildmode=list:longest,full

set winwidth=78
set winheight=4
set winminheight=4
set winheight=100

command! Q q
command! W w
command! WQ w
command! Wq wq

nmap <Space> <Leader>

nmap <Space><Space> <C-^>
imap <C-K> <Plug>(neosnippet_expand_or_jump)
imap <expr><Tab> pumvisible() ? "\<C-N>" : "\<Tab>"
inoremap jj <Esc>
inoremap jk <Esc>
inoremap kk <Esc>
nmap <Leader>" ysiw"
nmap <Leader>] ysiw]
nmap <Leader># ysiw}i#<Esc>
nmap <Leader>, mm/,$<CR>x`m
nmap <Leader>; mm/;$<CR>x`m
nmap <Leader>@ mmbi@<Esc>`m
nmap <Leader>( :s/(\([^(]*\))$/ \1/<CR>
nmap <Leader>' ysiw'
nmap <Leader>` ysiw`
nmap <Leader>fj gqaj
nnoremap <Leader>/ :Unite -no-empty grep:.<CR>
nnoremap <Leader>9 mmF(r f)r `m
nnoremap <Leader>A :UniteWithBufferDir -no-empty -start-insert file_rec/async<CR>
nnoremap <Leader>L "lyiWoconsole.log <C-R>l, '<C-R>l'<Esc>mm{j"lyiW`ma, '<C-R>l'<Esc>
nnoremap <Leader>\ :lcd %:p:h<CR>:pwd<CR>
nnoremap <Leader>a :UniteWithProjectDir -no-empty -start-insert file_rec/async<CR>
nnoremap <Leader>eb :Eb<Space>
nnoremap <Leader>es :Es<Space>
nnoremap <Leader>ec :Ec<Space>
nnoremap <Leader>c :Ec<Space>
" nnoremap <Leader>a :E
nnoremap <Leader>b :Unite -no-empty buffer:-<CR>
nnoremap <Leader>d :Unite -no-empty directory<CR>
nnoremap <Leader>ed :edit ~/Dropbox/Notes/diary.journal<CR>
nnoremap <Leader>ep :edit ~/Dropbox/Notes/posts.md<CR>
nnoremap <Leader>f- mmvip:s/^/- /<CR>`m
nnoremap <Leader>f= gqip
nnoremap <Leader>fS mmvip:sort!<CR>`m
nnoremap <Leader>f_ mmvip:s/^- //<CR>`m
nnoremap <Leader>fs mmvip:sort<CR>`m
nnoremap <Leader>fT :%s/\v(\S)\s{2,}(\S)/\1 \2/cg<CR>
nnoremap <Leader>ft :call Trim()<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gc :Gcommit<CR>i
nnoremap <Leader>gd :Gvdiff<CR>
nnoremap <Leader>gl :Glog -- %<CR>
nnoremap <Leader>gp :Gpull<CR>
nnoremap <Leader>gpo :Gpush<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>l "lyiwoconsole.log <C-R>l, '<C-R>l'<Esc>mm{j^"lyiW`ma, '<C-R>l'<Esc>
nnoremap <Leader>n :new<CR>
nnoremap <Leader>nn :new<CR>
nnoremap <Leader>nt :tabnew<CR>
nnoremap <Leader>pc :read !pbpaste <BAR> js2coffee<CR>
nnoremap <Leader>pj :read !pbpaste <BAR> html2jade<CR>
nnoremap <Leader>q :call Quit()<CR>
nnoremap <Leader>r :GitGutterRevertHunk<CR>
nnoremap <Leader>s :call Save()<CR>
nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader>tn :call TurnOnAllTests(['it','describe'])<CR>
nnoremap <Leader>ts :call ToggleTest('describe')<CR>
nnoremap <Leader>tt :call ToggleTest('it')<CR>
nnoremap <Leader>v :edit ~/.vimrc<CR>
nnoremap <Leader>w :write<CR>
nnoremap <Leader>y :Unite -no-empty history/yank<CR>
nnoremap <silent> p p`]
nnoremap K i<CR><Esc>
nnoremap N Nzz
nnoremap Q <Nop>
nnoremap Y y$
nnoremap [h :GitGutterPrevHunk<CR>
nnoremap ]h :GitGutterNextHunk<CR>
nnoremap cog :GitGutterLineHighlightsToggle<CR>
nnoremap j gj
nnoremap k gk
nnoremap n nzz
vmap <C-v> <Plug>(expand_region_shrink)
vmap v <Plug>(expand_region_expand)
vnoremap < <gv
vnoremap <Leader>fS mmvip:sort!<CR>`m
vnoremap <Leader>fs mmvip:sort<CR>`m
vnoremap <Leader>n "nd:new<CR>"nP
vnoremap <silent> p p`]
vnoremap <silent> y y`]
vnoremap > >gv

function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    execute 'NeoCompleteLock'
  endif
endfunction
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    execute 'NeoCompleteUnlock'
  endif
endfunction

function! ToggleTest(string)
  normal mtj
  execute('?^\s*f\=' . a:string)
  try
    execute('s/^\(\s*\)' . a:string . '/\1f' . a:string . '/')
    write
  catch
    execute('s/^\(\s*\)f' . a:string . '/\1' . a:string . '/')
  endtry
  normal `t
endfunction

function! TurnOnAllTests(list)
  normal mt
  for string in a:list
    try
      execute('%s/^\(\s*\)f' . string . '/\1' . string . '/')
      write
    catch
      " All tests are on already
    endtry
  endfor
  normal `t
endfunction

function! SetStatusLine() abort
  set statusline=%*\ %f\ "
  if exists('*fugitive#head')
    set statusline+=%1*%{fugitive#head()}\ %*
  endif
  set statusline+=%1*%H%M%R%W%*\ %{FileModified()}%=\ %l,%c\ %<%P\ "
endfunction

function! SetStatusLineForHelpers()
  setlocal statusline=\ %{tolower(&filetype)} nocursorline nonumber norelativenumber
endfunction

if !exists('*Save')
  function! Save()
    if exists(':Gstatus')
      try
        GitGutterStageHunk
        GitGutterNextHunk
      catch
        write
      endtry
    else
      write
    endif
  endfunction
endif

function! FileModified()
  let file=expand('%:p')
  let date=getftime(file)
  return GetTime(date)
endfunction

function! GetTime(time)
  if a:time < 0 | return 'new' | endif
  let sec = localtime() - a:time
  if sec < 1 | return 'saved' | endif
  if sec < 60 | return sec . 's' | endif
  if sec < 3600 | return (sec / 60) . 'm' | endif
  if sec < 3600 * 24 | return (sec / 3600) . 'h' | endif
  return (sec/86400) . 'd'
endfunction

function! Quit()
  let numberOfListedBuffers = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
  if numberOfListedBuffers > 1
    try
      bprevious | bdelete #
    catch
      " Can't delete buffer
    endtry
  else
    if &modified
      echohl WarningMsg | echo "This buffer has unsaved changes. I don't want to quit." | echohl None
    else
      quit
    endif
  endif
endfunction

noremap <Leader>j gg>GOtemplate(name='<C-R>=expand("%:t:r:r")<CR>')<Esc>:bn

function! Trim()
  let s:pos = getpos('.')
  retab
  %s/\s\+$//ge
  %s/\($\n\s*\)\+\%$//e
  call setpos('.', s:pos)
endfunction

function! RestoreCursorPositon()
  try
    normal! g`"
  catch
    " A mark isn't set
  endtry
endfunction

function! OpenHelp()
  if &filetype == 'help'
    execute "normal \<C-W>T"
  endif
endfunction

function! OpenTags ()
  if empty(&buftype)
    nnoremap <buffer> <C-]> :<C-u>UniteWithCursorWord -no-empty -immediately tag<CR>
  endif
endfunction

call SetStatusLine()

augroup Common
  autocmd!
  autocmd BufEnter *.txt call OpenHelp()
  autocmd BufWinEnter * call RestoreCursorPositon()
  autocmd BufWritePost *gvimrc source %
  autocmd BufWritePost *vimrc source %
  autocmd FileType gitcommit setlocal winheight=8
  autocmd FileType help setlocal winwidth=85 winheight=8
  autocmd FileType qf setlocal winheight=5
  autocmd FileType qf,help,gitcommit call SetStatusLineForHelpers()
augroup END

augroup CoffeeJadeStylus
  autocmd BufNewFile,BufRead,BufWrite *.tpl.jade setlocal filetype=jade
  autocmd BufNewFile,BufRead,BufWrite *.coffee,*.cjsx setlocal filetype=coffee
  autocmd BufWinEnter *.coffee,*.styl,*.jade call SetStatusLine()
  autocmd BufWrite *.coffee,*.cjsx,*.styl,*.jade,*.md,*.journal call Trim()
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType coffee setlocal omnifunc=coffeecomplete#Complete
  autocmd FileType coffee,jade setlocal foldmethod=indent nofoldenable
  autocmd FileType stylus setlocal omnifunc=csscomplete#CompleteCSS
augroup END

augroup Ctags
  autocmd!
  autocmd BufEnter * call OpenTags()
augroup END

augroup Prose
  autocmd!
  autocmd BufNewFile,BufRead,BufWrite *.md,*.markdown setlocal filetype=ghmarkdown
  autocmd BufWrite *.md,*.journal call Trim()
  autocmd FileType mail nnoremap <buffer> q ZZ
  autocmd FileType ghmarkdown,markdown setlocal omnifunc=htmlcomplete#CompleteTags spell formatoptions+=aw
augroup END
