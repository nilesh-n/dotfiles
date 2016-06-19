" If you set airline theme manually, make sure the airline-tmuxline extension is disabled, so it doesn't overwrite the theme:
" let g:airline#extensions#tmuxline#enabled = 0
" let g:tmuxline_preset = 'powerline'

let g:tmuxline_powerline_separators = 1

let g:tmuxline_preset = {
      \'a'    : 'S: #S',
      \'b'    : '#(whoami)',
      \'win'  : '#I #W',
      \'cwin' : ['#I', '#W'],
      \'y'    : ['%Y-%m-%d', '%H:%M:%S'],
      \'z'    : '#h'}

let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '⋮',
    \ 'right' : '',
    \ 'right_alt' : '⋮',
    \ 'space' : ' '}
