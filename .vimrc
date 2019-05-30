" Travis Hall
" Vim Plug {{{
call plug#begin('~/.vim/plugged')
" Colors
Plug 'sjl/badwolf'
" Other Stuff
Plug 'bling/vim-airline'
Plug 'ddrscott/vim-side-search'
Plug 'derekwyatt/vim-scala'
Plug 'fatih/vim-go'
Plug 'visualfc/gocode'
Plug 'janko-m/vim-test'
Plug 'keith/swift.vim'
Plug 'kien/ctrlp.vim'
Plug 'leafgarland/typescript-vim'
Plug 'moll/vim-node'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'simnalamburt/vim-mundo'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline-themes'
" Snipmate
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'hashivim/vim-terraform'
Plug 'honza/vim-snippets'
Plug 'tomtom/tlib_vim'
" Vimwiki
Plug 'vimwiki/vimwiki'
call plug#end()
" }}}

" Look and Feel {{{
syntax enable           " enable syntax processing
colorscheme badwolf
set termguicolors
"set guifont=Inconsolata\ for\ Powerline:h12
set guifont=Hack:h10
set guioptions=
" }}}

" Misc {{{
set backspace=indent,eol,start
let g:vimwiki_list = [{'path': '~/blog/content', 'index': '.index',
      \ 'syntax': 'markdown', 'ext': '.md', 
      \ 'diary_rel_path': '/notes/', 'diary_index': '.index'}]
" }}}

" Spaces & Tabs {{{
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
set ignorecase          " ignore case when searching
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

" Line Shortcuts {{{
nnoremap j gj
nnoremap k gk
nnoremap gV `[v`]
" }}}

" Leader Shortcuts {{{
let mapleader=","
nnoremap <leader>1 :set number!<CR>
nnoremap <leader><space> :noh<CR>
nnoremap <leader>R :TestFile<CR>
nnoremap <leader>a :SideSearch 
nnoremap <leader>c :SyntasticCheck<CR>:Errors<CR>
nnoremap <leader>d :Make! 
nnoremap <leader>eb :tabe ~/.profile<CR>
nnoremap <leader>ev :tabe $MYVIMRC<CR>
nnoremap <leader>h :A<CR>
nnoremap <leader>l :call ToggleNumber()<CR>
nnoremap <leader>m :silent make\|redraw!\|cw<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>r :TestNearest<CR>
nnoremap <leader>s :mksession<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
vnoremap <leader>y "+y
" }}}

" Insert Shortcuts {{{
inoremap <leader>, <C-x><C-o>
" }}}

" CtrlP {{{
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = '\vbuild/|dist/|venv/|target/|\.(o|swp|pyc|egg)$'
" }}}

" Syntastic {{{
let g:syntastic_python_flake8_args='--ignore=E501'
let g:syntastic_ignore_files = ['.java$']
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_check_on_open = 1
let g:syntastic_go_checkers = ['go', 'golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active' }
" }}}

" AutoGroups {{{
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.rb :call <SID>StripTrailingWhitespaces()
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
    autocmd BufEnter *.py setlocal tabstop=4
    autocmd BufEnter *.md setlocal ft=markdown
    autocmd BufEnter ~/blog/*.md setlocal ft=vimwiki
    autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END
" }}}

" Testing {{{
let test#strategy = 'neovim'
let test#python#runner = 'nose'
" }}}

" Backups {{{
set backup
set backupdir=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}


" airline {{{
set laststatus=2
let g:airline_theme = 'zenburn'
let g:airline_powerline_fonts = 1
" }}}

" Custom Functions {{{
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

function! <SID>CleanFile()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %!git stripspace
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
" }}}
