highlight NonText guifg=bg
set colorcolumn=140
set guifont=Menlo:h24
set guioptions-=T
set guioptions-=e
set guioptions-=r
set laststatus=0
set linespace=14
set nocursorline
set nolist
set nonumber
set noruler
set noshowcmd
set nowrap
set spell

" Open and reload .gvimrc
noremap <Leader>.g :tabnew ~/.gvimrc<CR>
autocmd! BufWritePost .gvimrc source %
