let g:ctrlp_map                 = '<c-p>' " Open CTRL P with ctrl+p
let g:ctrlp_open_new_file       = 1       " Open new, empty files in a tab
let g:ctrlp_open_multi          = '1t'    " When marking multiple files, open each of them up in their own tabs
let g:ctrlp_max_height          = 25      " Max height of window
let g:ctrlp_switch_buffer       = 2
let g:ctrlp_clear_cache_on_exit = 1       " Delete cache of files on exit
let g:ctrlp_mruf_max            = 250     " Remember this many recently used files
let g:ctrlp_root_markers        = ['Gemfile']

" Ignore git, hg and svn dirs and vim swap files
let g:ctrlp_custom_ignore = {
    \ 'dir': 'bundler_stubs\|tmp\|\.git$\|\.hg$\|\.svn$\|blib\|_build\|coverage',
    \ 'file': '\.exe$\|\.so$\|\.dll$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
\ }

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'
  " let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
