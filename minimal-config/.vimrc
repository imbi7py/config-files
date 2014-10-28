" Set leader key to ,
let mapleader = "\<Space>"

" vim instead of vi settings
set nocompatible

" spaces instead of tabs
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" Use C-style indentation
set cindent

" Do not show startup message
set shortmess=aIO

" Dont write backup and swap files
set nobackup
set nowritebackup
set noswapfile

" Use the mouse to move the cursor
set mouse=a

" keep the selection when moving blocks in v-mode
" vnoremap < <gv
" vnoremap > >gv

" Search settings
set hlsearch
set incsearch
set ignorecase
set smartcase

" show current command, matching bracket and mode, line numbers
set showcmd
set noshowmatch
set noshowmode
set number
" set cmdheight=2

" Long undo and command history
set undolevels=1000
set history=200

" hide buffers instead of closing
set hidden

" show a few lines below the current line
set scrolloff=7

" allow backspace to work over everything
set backspace=indent,eol,start

" Use backspace in normal mode
nnoremap <bs> X

" do not wrap lines automatically
set nowrap

" Use Ctrl-q for quitting, Ctrl-s for saving
noremap <C-Q> :q<CR>
vnoremap <C-Q> <Esc>:q<CR>
inoremap <C-Q> <Esc>:q<CR>

noremap <silent> <C-S>          :write<CR>
vnoremap <silent> <C-S>         <Esc>:write<CR>
inoremap <silent> <C-S>         <Esc>:write<CR>

" remap :W, :Q etc if you press the shift key for too long
cabbrev Q quit
cabbrev W write
cabbrev WQ wq
cabbrev Wq wq

" default encoding in UTF-8
filetype plugin indent on
set encoding=utf-8

" Syntax highlighting
syntax enable

" Clear search highlight (and redraw screen) with C-l
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>

" Autocompletion in command mode
set wildmenu
set wildmode=list:longest,full

" Hightlight the 80th column
set colorcolumn=80

" Decrease dead time after ESC key
set ttimeout
set ttimeoutlen=50


" Swap the current word with the next word (which can be on a newline and
" punctuation is skipped):
nmap <silent> gw "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><C-o>:noh<CR>

" Move to beginning/end of line while in insert mode
inoremap <C-a> <C-o>0
inoremap <C-e> <C-o>$

" Remember last position when reopening files
set viminfo='10,\"100,:20,%,n~/.viminfo
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Do not insert comment leaders automatically
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Bubble-move (inspired by http://vimcasts.org/episodes/bubbling-text/)
nmap <C-k> [e`]        " single lines
nmap <C-j> ]e`]
vmap <C-k> [e`[V`]     " visual mode
vmap <C-j> ]e`[V`]

" Switch off octal/hex number detection for <C-a>, <C-x>
set nrformats=

" Use '\' as ',' for going backwards trough character finds (opposite of ';')
noremap \ ,

" Use english messages
language en_US.UTF-8

" In addition to C-w: delete word around/after the cursor
imap <C-d> <C-o>daw
nmap <C-d> daw

" Use pointfree with 'gq' in haskell files
autocmd BufEnter *.hs set formatprg=xargs\ -0\ pointfree

" Duplicate a line / selection and comment out the first
nmap <Leader>c Ypkgccj
vmap <Leader>c gcgvyPgvgc

" Expand/Shrink visual selection
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Typing gcc is too much
nmap <C-e> gcc
imap <C-e> <C-o>gcc
vmap <C-e> gc

" Copy and paste to system clipboard with <Leader>p and <Leader>y
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Gnuplot
autocmd BufNewFile,BufRead *.gp set filetype=gnuplot
autocmd FileType gnuplot set commentstring=#\ %s