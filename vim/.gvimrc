set colorcolumn=140
set guifont=Menlo:h20
set guioptions-=L
set guioptions-=l
set guioptions-=R
set guioptions-=r
set guioptions-=T
set guioptions-=e
set laststatus=0
set linespace=8
set nocursorline
set nolist
set nonumber
set noruler
set noshowcmd
set nowrap
set spell
" set fu

" Open and reload .gvimrc
noremap <Leader>.g :tabnew ~/.gvimrc<CR>
autocmd! BufWritePost .gvimrc source %
