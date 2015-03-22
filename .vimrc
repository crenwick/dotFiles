" don't bother with vi compatibility
set nocompatible

" load pathogen
execute pathogen#infect()

" enable syntax highlighting
syntax enable
" filetype plugin indent on

set title hlsearch history=500
set smartindent
set autoindent
set autoread          " reload files when changed on disk, i.e. via `git checkout`
set clipboard=unnamed " yank and paste with the system clipboard
set directory-=.      " don't store swapfiles in the current directory
set expandtab         " expand tabs to spaces
set ignorecase        " case-insensitive search
set smartcase         " case-sensitive search if any caps
set incsearch         " search as you type
set laststatus=2      " always show statusline
set number            " show line numbers
set ruler             " show where you are
set scrolloff=5       " show context above/below cursor line
set sidescroll=1
set shiftwidth=2      " normal mode indentation commands uses 2 spaces
set softtabstop=2     " insert mode tab and backspace uses 2 spaces
set tabstop=2         " actual tab uses 8 spaces
set showmatch         " highlight matching on {[()]}
set list              " show trailing whitespace
set listchars=""
set listchars=tab:\ \
set listchars+=trail:.
set tabpagemax=30
set showcmd           " show current command going on
set wildignore=log/**,node_modules/**,target/**,tmp/**,.meteor/**,tmp/**
set wildmenu          " show a navigable menu for tab completion
set wildmode=longest,list,full

" highlight last inserted text
nnoremap gV `[v`]

" allow buffer to be hideen within writing to disk
set hidden

let mapleader=','
" append a semicolon to the line
nnoremap <leader>; $a;<Esc>

" keyboard shortcuts
" hjkl keys navigate buffer splits
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" highlight the 81st character in each line
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" markdown with fenced code gets marked
au BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html', 'sh']

" automatically reload vimrc when its saved
au BufWritePost .vimrc so ~/.vimrc

" open NERDTree automatically when vim starts
autocmd vimenter * NERDTree
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
" requires :Ctrl
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
