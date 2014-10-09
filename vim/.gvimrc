set guioptions-=T
set guioptions-=r
set guioptions-=e
set guifont=Droid\ Sans\ Mono\ for\ Powerline:h24
set backupcopy=yes
set nolist
set nonumber
set noruler
set colorcolumn=0
set noshowcmd
set laststatus=0
hi NonText guifg=bg
set linespace=5

" Open and reload .gvimrc
noremap <Leader>.g :tabnew ~/.gvimrc<CR>
autocmd! BufWritePost .gvimrc source % | AirlineRefresh
