" let g:airline_theme='base16_tomorrow'
let g:airline_theme='gruvbox'

" Do not draw separators for empty sections (only for the active window)
let g:airline_skip_empty_sections = 1

let g:airline#extensions#tabline#enabled = 1

" configure the minimum number of tabs needed to show the tabline.
let g:airline#extensions#tabline#tab_min_count = 2

let g:airline#extensions#tabline#tab_nr_type = 1 "tab number
" let g:airline#extensions#tabline#tab_nr_type = 2 "splits and tab number

" don't show closed buffer in tab list
let g:airline#extensions#tabline#show_buffers = 0

" don't show right side tab type and tab name when split
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_type = 0

" disable showing a summary of changed hunks under source control
let g:airline#extensions#hunks#enabled = 0

" symbols to use for tabline
let g:airline#extensions#tabline#close_symbol = '×'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '⋮'

" change set paste colour to red
" call airline#parts#define_accent('paste', 'red')
call airline#parts#define_accent('paste', 'yellow')

" Remove delay when switching between modes
" set ttimeoutlen=50 "might be too short for longer shortcuts, use powerline one

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_powerline_fonts=1

" unicode symbols
let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" old vim-powerline symbols
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

" new powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" custom
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = '⋮'
let g:airline_right_alt_sep = '⋮'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.paste = 'PASTE'
