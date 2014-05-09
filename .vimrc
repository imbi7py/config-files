" Set leader key to ,
let mapleader = ","

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
set shortmess=aI

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

" using zsh as standard shell
set shell=zsh

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

noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <Esc>:update<CR>
inoremap <silent> <C-S>         <Esc>:update<CR>

" remap :W, :Q etc if you press the shift key for too long
cabbrev Q quit
cabbrev W write
cabbrev WQ wq
cabbrev Wq wq

" Vundle
filetype off  " required to load Vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Bundles
Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'travitch/hasksyn'
Plugin 'groenewege/vim-less'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'plasticboy/vim-markdown'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'repeat.vim'
Plugin 'bronson/vim-visual-star-search'
Plugin 'tommcdo/vim-exchange'
Plugin 'godlygeek/tabular'
Plugin 'wellle/targets.vim'

" User defined text objects (i* and a*)
Plugin 'kana/vim-textobj-user'

    " Last search pattern (/)
    Plugin 'kana/vim-textobj-lastpat'

    " Comment (c)
    Plugin 'glts/vim-textobj-comment'

    " Entire file (e)
    Plugin 'kana/vim-textobj-entire'

    " Current line (l)
    Plugin 'kana/vim-textobj-line'

    " Functions (f) and classes (c) for python
    " TODO: c clashes with *c*omment
    Plugin 'bps/vim-textobj-python'

" UltiSnips
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

call vundle#end()

" default encoding in UTF-8
filetype plugin indent on
set encoding=utf-8

" Syntax highlighting and solarized colorscheme
syntax enable
set background=dark
colorscheme solarized
set t_Co=256
let g:solarized_termcolors=256
highlight clear SignColumn

set listchars=tab:▸\ ,eol:¬

" disable arrow keys :-)
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Clear search highlight (and redraw screen) with C-l
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>

" Autocompletion in command mode
set wildmenu
set wildmode=list:longest,full

" Syntastic
let g:syntastic_enable_highlighting=0
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0
let g:syntastic_enable_balloons=0
let g:syntastic_python_checkers=['flake8']
let g:syntastic_tex_checkers = []

" Use par to format text
" http://vimcasts.org/episodes/formatting-text-with-par/
set formatprg=par

" Hightlight the 80th column
set colorcolumn=80

" airline
set laststatus=2
let g:airline_powerline_fonts=1
" let g:airline#extensions#tabline#enabled=1

" Decrease dead time after ESC key
set ttimeout
set ttimeoutlen=50

" Synctex forward searching (use with <Leader> s)
" See http://tex.stackexchange.com/a/10374/42128
" Configure okular to call "vim --servername VIM --remote +'%l' '%f'"
" for backward searching (vim needs to run in server mode).
function! SynctexShow()
    let synctex = glob("*.synctex.gz")
    if strlen(synctex) == 0
        echo "No synctex file found."
    else
        let pdffile = substitute(synctex, "synctex.gz", "pdf", "")
        let execline = printf(":silent !okular --noraise --unique '%s\\#src:%d %s' & > /dev/null 2> /dev/null", shellescape(pdffile), line("."), shellescape(expand("%:p")))
        exec execline
        :redraw!
    end
endfunction
nmap <Leader>s :call SynctexShow()<CR>

" Call make
nmap <silent> <Leader>m :make<CR>

" Vim Markdown
let g:vim_markdown_folding_disabled=1

" Swap the current word with the next word (which can be on a newline and
" punctuation is skipped):
nmap <silent> gw "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><C-o>:noh<CR>

" Move to beginning/end of line while in insert mode
inoremap <C-a> <C-o>0
inoremap <C-e> <C-o>$

" Go in and out of paste mode with F10
set pastetoggle=<F10>

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

" Faster TeX syntax highlighting (disables some highlighting features)
let g:tex_fast="M"

" Use english messages
language en_US.UTF-8

" Align with respect to = or : with <Leader>= and <Leader>:
nmap <Leader>= :Tabularize /=<CR>
vmap <Leader>= :Tabularize /=<CR>
nmap <Leader>: :Tabularize /:\zs<CR>
vmap <Leader>: :Tabularize /:\zs<CR>

" LaTeX helpers
" Add a & to the first = in this line and append '\\' at the end
nmap <Leader>& ^f=i&<ESC>A \\<ESC>
" Change a ( .. ) part to \br{ .. }
nmap <Leader>b cs({i\bb<ESC>

" In addition to C-w: delete word around/after the cursor
imap <C-d> <C-o>daw

" Use pointfree with 'gq' in haskell files
autocmd BufEnter *.hs set formatprg=xargs\ -0\ pointfree

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Duplicate a line and comment out the top one
nmap <Leader>c Ypkgccj
