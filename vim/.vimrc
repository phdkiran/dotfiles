" .vimrc by Roman Zolotarev
" http://tools.romanzolotarev.com/vim

" load up pathogen and all bundles
call pathogen#infect()
call pathogen#helptags()

autocmd! bufwritepost .vimrc source %
" let base16colorspace=256
" colorscheme base16-eighties
set background=dark
let g:airline_powerline_fonts = 1

" set up some custom colors
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

" highlight the status bar when in insert mode
if version >= 700
  au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
  au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12
endif

" highlight trailing spaces in annoying red
highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/

syntax on
filetype plugin indent on
"set autoindent
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

if exists('+colorcolumn')
  set colorcolumn=79
endif

map <F5> :setlocal spell! spelllang=en_us<cr>
imap <F5> <ESC>:setlocal spell! spelllang=en_us<cr>

let mapleader = ","
map <leader>. :vsp ~/.vimrc<CR>:vertical res 79<CR>
map <leader>l :set list!<CR>
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>
map <C>n :vsp.

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

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


