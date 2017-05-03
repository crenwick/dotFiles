" -----------------------------------------------------
" General
" -----------------------------------------------------

set nocompatible      " not compatible with vi
set autoread          " reload files when changed on disk

let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

set title             " Set terminal title
set ruler             " Show where you are
set history=500

" Tab control
set softtabstop=2     " insert mode tab and backspace uses 2 spaces
set shiftwidth=2      " normal mode indentation commands uses 2 spaces
set expandtab         " expand tabs to spaces
set tabstop=2         " actual tab uses 8 spaces

set mouse=a           " click tabs, drag tabs, and drag split bars
set clipboard=unnamed " yank and paste with the system clipboard

set directory-=.      " don't store swapfiles in the current directory
set list              " show trailing whitespace
set listchars=""
set listchars=tab:\ \
set listchars+=trail:.
set tabpagemax=30
set showcmd           " show current command going on

" Code folding settings
set foldmethod=indent
set nofoldenable      " Remove ugly folds
set diffopt=filler,context:9999 "nofold in diff mode

set inccommand=split

" -----------------------------------------------------
" User Interface
" -----------------------------------------------------

set wildmenu          " enhanced command line completion
set wildmode=list:longest,full
set wildignore=log/**,target/**
set wildignore+=*.DS_Store
set wildignore+=*/_build**
set wildignore+=*/node_modules/**
set wildignore+=target/**
set wildignore+=tmp/**
set wildignore+=.meteor/local/**
set hidden            " allow buffer to be hidden when writing to disk
set scrolloff=5       " show context above/below cursor line
set shell=$SHELL

" Searching
" Finding Files
set path+=**          " Search down into subfolders
" - Hit tab to :find by partial math
" - Use * to make it fuzzy
" - :b lets autocomplete work in any open buffer

set ignorecase        " case-insensitive search
set smartcase         " case-sensitive search if any caps
set hlsearch
set incsearch         " search as you type

" Autocomplete:
" ^n for anything specified by the 'complete' option
" ^n and ^p to move up and down the list
" ^x^n for just this file
" ^x^f for filenames
" ^x^[ for tags only

set showmatch         " highlight matching on {[()]}
set mat=2             " how many tenths of a second to blink

" Error bells
set noerrorbells
set visualbell

syntax on             " enable syntax highlighting

" set es to javascript syntax
au BufNewFile,BufReadPost *.es6 set filetype=javascript
au BufNewFile,BufReadPost *.json set filetype=javascript
au BufRead,BufNewFile *.bash_profile set filetype=sh
au BufRead,BufNewFile *.bashrc set filetype=sh
au BufRead,BufNewFile Fastfile set filetype=ruby

" Theme
set encoding=utf8
let base16colorspace=256
set t_Co=256          " explicitly tell vim the terminal supports 256
set number            " show the current line number

set autoindent        " automatically set indent of new line
set smartindent


" -----------------------------------------------------
" Files, backups and undo
" -----------------------------------------------------
set noswapfile        " Don't make backups.
set nowritebackup     " Even if you did make a backup, don't keep it around.
set nobackup

" -----------------------------------------------------
" Statusline
" -----------------------------------------------------

set laststatus=2      " show the status line all the time

" -----------------------------------------------------
" Mappings
" -----------------------------------------------------

" hjkl keys navigate buffer splits
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" to save all files
nnoremap <Leader>w :wa<CR>

" enter visual line mode
nmap <Leader><Leader> V

" Tag Jumping:
command! MakeTags !ctags -R .
" Create the `tags` file (requires ctags)
" - Use ^] to jump to tag under cursor
" - Use g^] for a list of tags under cursor
" - Use ^t to jump back up the tag stack

" Get rid of trailing whitespace
nnoremap <Leader>WS :%s/\s\+$//<CR>

" buffer nav shortcuts
nnoremap <leader>b :ls<CR>
nnoremap <leader>H :bn<CR>
nnoremap <leader>L :bp<CR>

" nvim-terminal-emulator
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" -----------------------------------------------------
" Snippets
" -----------------------------------------------------

nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a

" -----------------------------------------------------
" Plugins
" -----------------------------------------------------

call plug#begin('~/.local/share/nvim/plugged')

source $HOME/.vim/bundles-neo.vimrc

call plug#end()

" -----------------------------------------------------
" UI
" -----------------------------------------------------

set background=dark
colorscheme despacio

" highlight the 80st character in each line
highlight MyLineTooLongMarker ctermbg=magenta guibg=Magenta
autocmd WinEnter * match MyLineTooLongMarker '\%81v'
