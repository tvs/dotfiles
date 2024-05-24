let mapleader=","

nmap j gj
nmap k gk
nmap gV `[v`]

" Toggle line numbers
nmap <leader>1 :set number!<CR>

" Toggle relative line numbers
nmap <leader>2 :call ToggleNumber()<CR>

" Disable search highlighting
nmap <leader><space> :noh<CR>

" Edit bash profile
nmap <leader>eb :tabe ~/.profile<CR>

" Edit and source vim profile
nmap <leader>ev :Tex ~/.vim<CR>
nmap <leader>sv :source $MYVIMRC<CR>

" ChadTree
nmap <leader>n <cmd>CHADopen<CR>

" Copy to clipboard
vmap <leader>y "+y

" Golang shortcuts
autocmd BufEnter *.go nmap <leader>i :CocCommand go.impl.cursor<Enter>
autocmd BufEnter *.go nmap <leader>ii <Plug>(go-implements)
autocmd BufEnter *.go nmap <leader>ci <Plug>(go-describe)
autocmd BufEnter *.go nmap <leader>cc <Plug>(go-callers)
autocmd BufEnter *.go nmap <leader>cs <Plug>(go-callstack)

" auto-sort and import missing packages
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

nmap <C-w>o :ZoomToggle<CR>

" Coc Fun
nmap <leader>r <Plug>(coc-rename)
nmap <leader>d :CocDiagnostics<CR>
nmap <leader>cr <Plug>(coc-references)
nmap <leader>l :call CocAction('diagnosticNext')<CR>
nmap <leader>k :call CocAction('diagnosticPrevious')<CR>

" fix syntax highlighting manually when it blows up
nmap <leader>ss :syntax sync fromstart<CR>

" tag pop and push for all files
nmap <C-a> <C-o>
nmap <C-d> <Plug>(coc-definition)

nmap <leader>qq <Plug>(coc-float-hide)
