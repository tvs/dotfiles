" Vim Plug {{{
call plug#begin('~/.vim/plugged')
" Colors
Plug 'sjl/badwolf'
" Miscellaneous
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'ryanoasis/vim-devicons'
" Autocompletion & Linting
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Golang
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}

" Vimwiki
"Plug 'vimwiki/vimwiki'
call plug#end()
" }}}

" airline {{{
set laststatus=2
let g:airline_theme = 'badwolf'
let g:airline_powerline_fonts = 1
" }}}

" chadtree {{{
let g:chadtree_settings = { 
  \"theme": {
    \"icon_glyph_set": "devicons",
    \"text_colour_set": "solarized_universal",
  \} 
\}
" }}}

" vim-go {{{
" disable linters as we're using coc.nvim for that
let g:go_diagnostics_enabled = 0
let g:go_metalinter_enabled = []

" don't jump to errors after metalinter is invoked
let g:go_jump_to_error = 0

" run go imports on file save
let g:go_fmt_command = "goimports"

" automatically highlight variable your cursor is on
let g:go_auto_sameids = 0

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
"let g:go_highlight_variable_declarations = 1
"let g:go_highlight_variable_assignments = 1
"let g:go_highlight_functions = 1
"let g:go_highlight_function_calls = 1
"let g:go_imports_autosave = 0
"let g:go_highlight_string_spellcheck = 0
" }}}

" Vimwiki {{{
let g:vimwiki_list = [{'path': '~/notes', 'index': '.index',
      \ 'syntax': 'markdown', 'ext': '.md', 
      \ 'diary_rel_path': '/notes/', 'diary_index': '.index'}]
" }}}
