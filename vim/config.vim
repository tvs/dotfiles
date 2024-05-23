" Look and Feel {{{
syntax enable           " enable syntax processing
set background=dark
let g:gruvbox_material_background='medium'
let g:gruvbox_material_better_performance=1
let g:gruvbox_material_foreground='material'
colorscheme gruvbox-material
set termguicolors
set guifont=HackNerd:h11
set guioptions=
set colorcolumn=80
set mouse=a " Allow mouse scrolling in the window
" }}}

" Spaces & Tabs {{{
set backspace=indent,eol,start
set tabstop=2           " 2 space tab
set expandtab           " use spaces for tabs
set softtabstop=2       " 2 space tab
set shiftwidth=2
set modelines=1
filetype indent on
filetype plugin on
" }}}

" UI Layout {{{
set number              " show line numbers
set showcmd             " show command in bottom bar
set nocursorline        " highlight current line
set wildmenu
set lazyredraw
set showmatch           " higlight matching parenthesis
set fillchars+=vert:┃
" }}}

" Searching {{{
set smartcase           " ignore case when searching unless you add capitals
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches
" }}}

" Folding {{{
"=== folding ===
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
nnoremap <space> za
set foldlevelstart=10   " start with fold level of 10
" }}}


" AutoGroups {{{
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.go,*.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.rb :call StripTrailingWhitespaces()
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
    autocmd BufEnter *.py setlocal tabstop=4
    autocmd BufEnter *.md setlocal ft=markdown
    autocmd BufEnter ~/notes/*.md setlocal ft=vimwiki nowrap
    autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END
" }}}

" Backups {{{
set backup
set backupdir=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}

