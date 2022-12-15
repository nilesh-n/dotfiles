set nocompatible
let mapleader=" "
set fillchars=vert:│
set encoding=utf-8
set belloff=all
set bg=dark
set hidden
set noswapfile
set nobackup
set number
set relativenumber
set nobackup
set ignorecase
set smartcase
set wildmenu
set wildignorecase
set wildignore+=*/.hg/*,*/.svn/*,*.swp,*.swo,*/node_modules/*
set showcmd
set termguicolors
" set splitbelow
set splitright
set showmatch
set nowrap
set expandtab
set shiftround
set tabstop=2 softtabstop=2
set shiftwidth=2
set backspace=indent,eol,start
set history=50
set scrolloff=7
set laststatus=2
set updatetime=100
set nojoinspaces " use only one space when joining lines with J or gq
" set clipboard+=unnamedplus
" set formatoptions-=o " O and o, don't continue comments

" nvim specific
set inccommand=split
set pumblend=15

call plug#begin('~/.config/nvim/plugged')
" essentials
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf.vim'
Plug 'gruvbox-community/gruvbox'
" Plug 'sheerun/vim-polyglot'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'janko-m/vim-test'
Plug 'tpope/vim-dispatch'
Plug 'slim-template/vim-slim'

" utility
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'kassio/neoterm'
" Plug 'tpope/vim-endwise'

" colorschemes
Plug 'luxed/ayu-vim'
Plug 'romainl/apprentice'
Plug 'tiagovla/tokyodark.nvim'

" styling
Plug 'pacha/vem-statusline'
" Plug 'edkolev/tmuxline.vim'

" docs lookup
Plug 'romainl/vim-devdocs'
" Plug 'dbeniamine/cheat.sh-vim'

"" (testing) neovim cheat alternative
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-cheat.sh'

" neovim
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

Plug 'ThePrimeagen/harpoon'

"lsp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp' " Autocompletion plugin
Plug 'hrsh7th/cmp-nvim-lsp' " LSP source for nvim-cmp
Plug 'hrsh7th/cmp-buffer' " Buffer completion source

call plug#end()

"-----------------------------------------------------------------------------
" keymaps
"-----------------------------------------------------------------------------

" edit & source vim config files
nmap <leader><leader>e :edit ~/dotfiles/nvim/init.vim<cr>
nmap <leader><leader>r :source ~/dotfiles/nvim/init.vim<cr>

" quicker split navigation
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>

" quicker buffer navigation
nnoremap <leader>p :ls<CR>:b<Space>
nnoremap <leader>j <Esc>:bprevious<CR>
nnoremap <leader>k <Esc>:bnext<CR>
nnoremap <leader>l <Esc>:b#<CR>
" nnoremap <Tab> <Esc>:b#<CR>

" quicker tab navigation
nnoremap <PageUp>   :tabprevious<CR>
nnoremap <PageDown> :tabnext<CR>

" Clears hlsearch after doing a search, otherwise just does normal <CR> stuff
nnoremap <expr> <CR> {-> v:hlsearch ? ":nohl\<CR>" : "\<CR>"}()

" resize splits
nnoremap <leader>= :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <Left>  <C-w>5<
nnoremap <Right> <C-w>5>
nnoremap <Up>    <C-w>+
nnoremap <Down>  <C-w>-

" yank to system clipboard (with leader y)
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

" (testing) move lines up and down in insert/visual mode
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>

" quicker terminal navigation
if has('nvim')
  " " Make esc leave terminal mode
  " tnoremap <Esc><Esc> <C-\><C-n>

  " " Easy moving between the buffers
  " tnoremap <C-h> <C-\><C-n><C-w>h
  " tnoremap <C-j> <C-\><C-n><C-w>j
  " tnoremap <C-k> <C-\><C-n><C-w>k
  " tnoremap <M-l> <C-\><C-n><C-w>l

  " " Try and make sure to not mangle space items
  " tnoremap <S-Space> <Space>
  " tnoremap <C-Space> <Space>

  " https://github.com/junegunn/fzf.vim/issues/544
  tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"
  " au TermOpen * tnoremap <buffer> <Esc> <C-\><C-n>
  " au FileType fzf tunmap <buffer> <Esc>

  au TermOpen * tnoremap <buffer> <C-h> <C-\><C-n><C-w>h
  au TermOpen * tnoremap <buffer> <C-j> <C-\><C-n><C-w>j
  au TermOpen * tnoremap <buffer> <C-k> <C-\><C-n><C-w>k
  au TermOpen * tnoremap <buffer> <M-l> <C-\><C-n><C-w>l
endif

"-----------------------------------------------------------------------------
" abbreviations
"-----------------------------------------------------------------------------

" type :vb<space> to open buffer in a vertical split
cabbrev vb vert sb

" fugitive: quick expansion for git commands
cabbrev git Git

"-----------------------------------------------------------------------------
" colours
"-----------------------------------------------------------------------------

" for true colour to work with tmux
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" gruvbox
" let g:gruvbox_contrast_dark='hard'
" let g:gruvbox_invert_selection='0'
" colorscheme gruvbox

" ayu: options - light/dark/mirage
let ayucolor='dark'
colorscheme ayu
let g:ayu_extended_palette = 1
highlight ErrorMsg guibg=#F07178 guifg=#0A0E14
" highlight NormalFloat guibg=#161e26
" highlight FloatBorder guibg=#161e26
" highlight PmenuSel ctermbg=242 guibg=#142335
highlight PmenuSel cterm=reverse gui=reverse

" make cursor line nr & sign column blend in
highlight CursorLineNR guibg=none
highlight SignColumn guibg=none

" highlight marked files in netrw the same colour as search
highlight link netrwMarkFile Search

"-----------------------------------------------------------------------------
" plugin configs
"-----------------------------------------------------------------------------

" fugitive: remaps
" quickly open git status
nnoremap <leader>gg :Git<CR>

" fzf
set rtp+=/usr/local/opt/fzf
let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.8 } }
let g:fzf_preview_window = 'right:50%'
let g:fzf_history_dir = '~/.fzf_history'
let $FZF_DEFAULT_OPTS='--reverse'

" fzf: remaps
" nnoremap <C-p> :Files <CR>
" nnoremap <leader>p :Buffers<CR>
nnoremap <leader>rr :Rg <C-R>=expand("<cword>")<CR><CR>
map <leader>f :Rg<Space>

" neoterm
let g:neoterm_autoscroll=1
let g:neoterm_default_mod='botright'
let g:neoterm_automap_keys='<nop>'

" neoterm: remaps
nmap <leader>t :Ttoggle<CR>

" vim-test
let test#strategy = 'neoterm'
" let test#strategy = 'harpoon'
" let test#strategy = 'neovim'
" let test#neovim#term_position = 'belowright'

" vim-test: remaps
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-g> :TestVisit<CR>
nmap <silent> <leader>1 :TestSuite<CR>
nmap <silent> <leader>2 :TestVisit<CR>
nmap <silent> <leader>3 :TestNearest<CR>
nmap <silent> <leader>4 :TestFile<CR>
nmap <silent> <leader>5 :TestLast<CR>

" coc
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" coc: remaps
nnoremap <leader>rw :CocSearch <C-R>=expand("<cword>")<CR><CR>

" auto-pairs
let g:AutoPairsCenterLine=0

" vem-statusline
let g:vem_statusline_parts = 'bfpP'
let g:vem_statusline_branch_function = 'fugitive#head'

" telescope
lua require('nilesh')

" telescope: remaps
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>p <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fl <cmd>Telescope git_files<cr>
nnoremap <leader>fe <cmd>Telescope file_browser<cr>
nnoremap <leader>fs :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>fw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>fc :lua require('nilesh').search_dotfiles()<CR>

" harpoon: remaps
nnoremap <leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <M-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>

nnoremap <M-j> :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <M-k> :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <M-l> :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <M-;> :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <leader>hf :lua require("harpoon.term").gotoTerminal(1)<CR>
nnoremap <leader>hd :lua require("harpoon.term").gotoTerminal(2)<CR>
nnoremap <leader>if :lua require("harpoon.term").sendCommand(1, 'ls\n')<CR>
nnoremap <leader>id :lua require("harpoon.term").sendCommand(1, 2)<CR>

" lsp (mappings & config in init.lua)
set completeopt=menuone,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

"-----------------------------------------------------------------------------
" miscellaneous
"-----------------------------------------------------------------------------

" enable blinking cursor in nvim
:set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
      \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
      \,sm:block-blinkwait175-blinkoff150-blinkon175

" turn on spellchecking for markdown and gitcommit files
autocmd FileType gitcommit setlocal spell
autocmd FileType markdown setlocal spell
set complete+=kspell

" highlight yanked text
" use higroup to change highlight colour, e.g {higroup="IncSearch"}
augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Search", timeout=200})
augroup END

" autocmd BufRead */db/schema.rb lua vim.diagnostic.disable()
" autocmd BufReadPre schema.rb :lua vim.diagnostic.disable()
autocmd BufReadPost,BufWinEnter schema.rb :LspStop

" gets overwritten by vim-polyglot: https://stackoverflow.com/a/8748154
" O and o, don't continue comments to a newline
autocmd BufNewFile,BufRead * setlocal formatoptions-=o

" use slim syntax highlighting for *.inky-slim files
autocmd BufNewFile,BufRead *.inky-slim setlocal filetype=slim
