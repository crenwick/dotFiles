" -----------------------------------------------------
" General
" -----------------------------------------------------

set nocompatible      " not compatible with vi
set autoread          " reload files when changed on disk,

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

" code folding settings
set foldmethod=indent
set nofoldenable      " Remove ugly folds
set diffopt=filler,context:9999 "nofold in diff mode

" -----------------------------------------------------
" User Interface
" -----------------------------------------------------

set wildmenu          " show a navigable menu for tab completion
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
set sidescroll=1

set shell=/bin/bash\ -li
" fix shell?
if &shell =~# 'fish$'
  set shell=sh
endif

" Searching
set ignorecase        " case-insensitive search
set smartcase         " case-sensitive search if any caps
set hlsearch
set incsearch         " search as you type

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

" set laststatus=2      " always show status

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

" enter visual line mode:
nmap <Leader><Leader> V

" Tag Jumping:
command! MakeTags !ctags -R .
" Create the `tags` file (requires ctags)
" - Use ^] to jump to tag under cursor
" - Use g^] for a list of tags under cursor
" - Use ^t to jump back up the tag stack

" Get rid of trailing whitespace
nnoremap <leader>WW :%s/\s\+$//<CR>

" buffer nav shortcuts
nnoremap <leader>b :ls<CR>
nnoremap <leader>H :bn<CR>
nnoremap <leader>L :bp<CR>

" -----------------------------------------------------
" Snippets
" -----------------------------------------------------

nnoremap ,html :-1read $HOME/.vim/snippets/skeleton.html<CR>3jwf>a
nnoremap ,defmod :-1read $HOME/.vim/snippets/skeleton.defmodule.ex<CR>ela
nnoremap ,mdoc :-1read $HOME/.vim/snippets/skeleton.moduledoc.ex<CR>jA

" -----------------------------------------------------
" Plugins
" -----------------------------------------------------

call plug#begin()

source $HOME/.vim/bundles.vimrc

call plug#end()



" -----------------------------------------------------
" -----------------------------------------------------
filetype plugin on
filetype indent on

" sourcing before custom scripts can go here

" Configure as Privacy Plugin
" All sensitive data is not stored in your ~/.vimrc folder
" Configure the spelling language and file.
set spelllang=en
set spellfile=$HOME/vim_spell/en.utf-8.add

" UndoDir:
let s:homeFolder = $HOME
let s:undoDir = s:homeFolder . '/vimUndo'
set undofile
set undolevels=500
set undoreload=500
" Create undo dir if needed - not in your dotVim folder! It should be local to
" your computer.
if !isdirectory(s:undoDir)
  call mkdir(s:undoDir)
endif
execute "set undodir=".s:undoDir
" Since your file/folder history may show up in a git commit!
let g:netrw_dirhistmax=0

" stackoverflow.com/questions/6852763/vim-quickfix-list-launch-files-in-new-tab
set switchbuf+=usetab,newtab

" -----------------------------------------------------
" UI
" -----------------------------------------------------

set background=dark
colorscheme despacio

" highlight the 80st character in each line
autocmd WinEnter * match Error '\%81v'