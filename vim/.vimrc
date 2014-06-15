" .vimrc by Roman Zolotarev
" http://tools.romanzolotarev.com/vim

" Load up pathogen and all bundles
call pathogen#infect()
call pathogen#helptags()

set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

if has('persistent_undo')
  silent !mkdir ~/.vim/undo > /dev/null 2>&1
  set undofile                  " Save undo's after file closes
  set undodir=~/.vim/undo/
  set undolevels=100            " How many undos
  set undoreload=3000           " Number of lines to save for undo
endif

silent !mkdir ~/.vim/swap > /dev/null 2>&1
set backupdir=~/.vim/swap/
set directory=~/.vim/swap/
set splitbelow
set splitright

imap jk <ESC>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nnoremap <silent> <leader>s :set spell!<CR>
nnoremap <leader>m :tabn<CR>
nnoremap <leader>n :tabp<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>D :Unite -start-insert directory<CR>
nnoremap <leader>p :Unite -start-insert history/yank<CR>
nnoremap <leader>g :Unite -silent -start-insert menu:git<CR>
nnoremap <leader>j :Unite -silent -start-insert menu:all menu:git<CR>
set shell=/bin/bash

autocmd! bufwritepost .vimrc source %

" let base16colorspace=256
" colorscheme base16-eighties
set background=dark
let g:airline_powerline_fonts = 1

" Set up some custom colors
highlight clear SignColumn
highlight ColorColumn  ctermbg=237
highlight CursorLine   ctermbg=236
highlight CursorLineNr ctermbg=236 ctermfg=240
highlight IncSearch    ctermbg=3   ctermfg=1
highlight LineNr       ctermbg=236 ctermfg=240
highlight Pmenu        ctermbg=240 ctermfg=12
highlight PmenuSel     ctermbg=3   ctermfg=1
highlight Search       ctermbg=1   ctermfg=3
highlight SpellBad     ctermbg=0   ctermfg=1
highlight StatusLine   ctermbg=240 ctermfg=12
highlight StatusLineNC ctermbg=238 ctermfg=0
highlight VertSplit    ctermbg=236
highlight Visual       ctermbg=3   ctermfg=0

" Highlight the status bar when in insert mode
if version >= 700
  au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
  au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12
endif

" Highlight trailing spaces in annoying red
highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/

syntax on
filetype plugin indent on
" Fugitive menu in Unite (depends on both Fugitive and Unite.vim) {{{
let g:unite_source_menu_menus = {}
let g:unite_source_menu_menus.git = {}
let g:unite_source_menu_menus.git.description = 'git (Fugitive)'
let g:unite_source_menu_menus.git.command_candidates = [
    \['▷ git blame        (Fugitive)',
        \'Gblame'],
    \['▷ git stage        (Fugitive)',
        \'Gwrite'],
    \['▷ git checkout     (Fugitive)',
        \'Gread'],
    \['▷ git rm           (Fugitive)',
        \'Gremove'],
    \['▷ git mv           (Fugitive)',
        \'exe "Gmove " input("destino: ")'],
    \['▷ git push         (Fugitive, output buffer)',
        \'Git! push'],
    \['▷ git pull         (Fugitive, output buffer)',
        \'Git! pull'],
    \['▷ git prompt       (Fugitive, output buffer)',
        \'exe "Git! " input("comando git: ")'],
    \['▷ git cd           (Fugitive)',
        \'Gcd'],
    \]

set cursorline
set expandtab
set incsearch
set laststatus=2
set listchars=tab:»·,trail:·,eol:¬
set nocompatible
set nofoldenable
set nowrap
set number
set ruler
set scrolloff=2
set shiftwidth=2
set showmatch
set smartcase
set ts=2
set wildmenu
set wildmode=list:longest,full

command! -nargs=* Wrap set wrap linebreak nolist
command! -nargs=* Nowrap set nowrap

set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]
set colorcolumn=79

let mapleader = ","
map <leader>. :vsp ~/.vimrc<CR>:vertical res 79<CR>
map <leader>l :set list!<CR>
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>
map <C>n :vsp.
map <F5> :setlocal spell! spelllang=en_us<cr>
imap <F5> <ESC>:setlocal spell! spelllang=en_us<cr>
nnoremap <silent> <Leader>/ :nohlsearch<CR>
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Disable arrow keys. That's not Emacs, that's why.
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' &&
    (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column =
    strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position =
    strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call
    search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable = 1
let g:unite_split_rule = "botright"

set encoding=utf-8
