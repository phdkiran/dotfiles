set guioptions-=T
set guioptions-=r
set guifont=Droid\ Sans\ Mono\ for\ Powerline:h20
set backupcopy=yes

" Open and reload .gvimrc
noremap <Leader>.g :tabnew ~/.gvimrc<CR>
autocmd! BufWritePost .gvimrc source % | AirlineRefresh
