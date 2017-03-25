filetype on
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'bling/vim-airline'
" Plugin 'fatih/vim-go'

call vundle#end()
filetype plugin indent on

set nocompatible

set backspace=indent,eol,start

syntax on

set autoindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

set laststatus=2
set hlsearch
set incsearch
set ignorecase smartcase

set mouse=a

set nobackup
set noswapfile

set wildmode=longest,list
set wildmenu

au FileType gitcommit set tw=55

set ignorecase
set smartcase
set hlsearch
set incsearch

" show matching brackets
set showmatch

set noerrorbells

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
    set background=dark
    colorscheme solarized
    set guifont:Menlo:h13
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" overwrites pageup
" map <C-b> :w<CR>:! nosetests<CR>

" Clear highlighting until next search
" :noh
nnoremap <F3> :noh<CR>

" Go back to previous buffer
nnoremap <F2> :b#<CR>

let mapleader=","
nnoremap ; :

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Disable Ex mode
map Q <Nop>

noremap <s-u> <c-r>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" " Indent if we're at the beginning of a line. Else, do completion.
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>


nmap <silent> <RIGHT>         :cnext<CR>
nmap <silent> <UP>            :n<CR>
nmap <silent> <LEFT>          :cprev<CR>
nmap <silent> <DOWN>          :N<CR>

"noremap <s-y> :w !pbcopy<CR>
vmap <s-y> "+y

" vim-go
" let g:go_fmt_command = "goimports"
