set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'rust-lang/rust.vim'

call vundle#end()            " required
filetype plugin indent on    " required

" for airline
set laststatus=2


set backspace=indent,eol,start

syntax on
filetype plugin indent on
set autoindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

set paste
set ruler

set hlsearch
set incsearch
set ignorecase smartcase

set mouse=a

set nobackup

set showcmd
nnoremap ; :
set wildmode=longest,list

" Mastering Vim with Conway

nmap <silent> <RIGHT>         :cnext<CR>
nmap <silent> <UP>            :cnf<CR><C-G>
nmap <silent> <LEFT>          :cprev<CR>
nmap <silent> <DOWN>          :cpf<CR><C-G>

"Only apply to .txt files...
augroup HelpInTabs
    autocmd!
    autocmd BufEnter  *.txt   call HelpInNewTab()
augroup END

"Only apply to help files...
function! HelpInNewTab ()
    if &buftype == 'help' "&& g:help_in_tabs
        "Convert the help window to a tab...
        execute "normal \<C-W>T"
    endif
endfunction

if has ('gui_running')
    set background=dark
    colorscheme solarized
    set guifont=Menlo:h13
endif

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
