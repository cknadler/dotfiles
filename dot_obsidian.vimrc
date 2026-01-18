""""""""""""""""""""""""
" bindings
""""""""""""""""""""""""

" better search
nnoremap / /\v
vnoremap / /\v

" tab to move to next match
nnoremap <tab> %
vnoremap <tab> %

" quick colon
nnoremap ; :
vnoremap ; :

" get j and k to work as expected on super long (wrapped) lines
nnoremap j gj
nnoremap k gk

" yank to the end of the line
nnoremap Y y$

""""""""""""""""""""""""
" unbindings
""""""""""""""""""""""""

" disable ZZ, use :wq
nnoremap ZZ <NOP>
