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
highlight VertSplit    ctermbg=236
highlight ColorColumn  ctermbg=237
highlight LineNr       ctermbg=236 ctermfg=240
highlight CursorLineNr ctermbg=236 ctermfg=240
highlight CursorLine   ctermbg=236
highlight StatusLineNC ctermbg=238 ctermfg=0
highlight StatusLine   ctermbg=240 ctermfg=12
highlight IncSearch    ctermbg=3   ctermfg=1
highlight Search       ctermbg=1   ctermfg=3
highlight Visual       ctermbg=3   ctermfg=0
highlight Pmenu        ctermbg=240 ctermfg=12
highlight PmenuSel     ctermbg=3   ctermfg=1
highlight SpellBad     ctermbg=0   ctermfg=1

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
set autoindent
set ts=2
set shiftwidth=2
set expandtab
set nocompatible
set number
set showmatch
set cursorline
set smartcase
set incsearch
set ruler
set scrolloff=2
set laststatus=2
set listchars=tab:»·,trail:·,eol:¬
set nowrap
set nofoldenable
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
