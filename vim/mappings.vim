let mapleader=","

nnoremap j gj
nnoremap k gk
nnoremap gV `[v`]

" Toggle line numbers
nnoremap <leader>1 :set number!<CR>

" Toggle relative line numbers
nnoremap <leader>l :call ToggleNumber()<CR>

" Disable search highlighting
nnoremap <leader><space> :noh<CR>

" Edit bash profile
nnoremap <leader>eb :tabe ~/.profile<CR>

" Edit and source vim profile
nnoremap <leader>ev :tabe ~/.vim<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" ChadTree
nnoremap <leader>n <cmd>CHADopen<CR>

" Copy to clipboard
vnoremap <leader>y "+y
