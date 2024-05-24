" Vim Plug {{{
call plug#begin('~/.vim/plugged')
" Colors
Plug 'sainnhe/gruvbox-material'
"Plug 'sjl/badwolf'
" Miscellaneous
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'ryanoasis/vim-devicons'
Plug 'sindrets/diffview.nvim'
Plug 'markstory/vim-zoomwin'
" Autocompletion & Linting
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Golang
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
call plug#end()
" }}}

" airline {{{
set laststatus=2
let g:airline_theme = 'gruvbox_material'
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

" diffview
let g:diffview_view_merge_tool_layout="diff4_mixed"
let g:diffview_view_merge_tool_disable_diagnostics=1

" coc {{{
let g:coc_global_extensions = ['coc-go', 'coc-git', 'coc-yaml', 'coc-json', 'coc-html', 'coc-css']
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
