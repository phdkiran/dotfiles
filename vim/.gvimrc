set colorcolumn=140
set guifont=Menlo:h20
set guioptions-=L
set guioptions-=l
set guioptions-=R
set guioptions-=r
set guioptions-=T
set guioptions-=e
set laststatus=0 linespace=8 nocursorline nolist 
set nonumber norelativenumber noruler noshowcmd nowrap spell

autocmd! BufWritePost .gvimrc source %
