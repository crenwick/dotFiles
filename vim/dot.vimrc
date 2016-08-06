call plug#begin()

source $HOME/.vim/bundlesVimRc

call plug#end()

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

" Error bells
set noerrorbells
set visualbell

syntax on             " enable syntax highlighting

set number            " show line numbers

set autoindent
set smartindent

set background=dark

" highlight the 81st character in each line
highlight MyLineTooLongMarker ctermbg=magenta guibg=Magenta
autocmd WinEnter * match MyLineTooLongMarker '\%81v'

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

" Get rid of trailing whitespace
nnoremap <leader>WW :%s/\s\+$//<CR>

" buffer nav shortcuts
nnoremap <leader>b :ls<CR>
nnoremap <leader>H :bn<CR>
nnoremap <leader>L :bp<CR>

" -----------------------------------------------------
" Plugins
" -----------------------------------------------------

" :ultisnips
let g:UltiSnipsSnippetsDir=$HOME . '/.vim'
let g:UltiSnipsSnippetDirectories=['myUltiSnippets']

" :TComment
vmap <D-/> <c-_><c-_>
vmap <D-s-/> <c-_>b
" mapping to `gc` doesn't toggle one visually selected line - only multiples.
nmap <D-/> gc$

" :dragvisuals
vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
let g:DVB_TrimWS = 1  " Remove any introduced trailing whitespace after moving

" :AutoComplPop
let g:acp_ignorecaseOption = 1

" :fugitive
nnoremap <leader>gs :Gstatus<CR>

" :vim-jsx
let g:jsx_ext_required = 0

" :VimJSDocSnippets
let g:JSDocSnippetsMapping='<D-C>'

" :rainbow_parentheses
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
augroup rainbow_js
  autocmd!
  autocmd FileType javascript,js,jsx,es6 RainbowParentheses
augroup END

" :NERDTree
let g:NERDTreeDirArrows = 1 " nice arrow
let g:NERDTreeMinimalUI = 1 " not so much cruft
let g:NERDTreeShowBookmarks = 1
hi def link NERDTreeRO Normal
hi def link NERDTreePart StatusLine
hi def link NERDTreeDirSlash Directory
hi def link NERDTreeCurrentNode Search
hi def link NERDTreeCWD Normal
let g:NERDChristmasTree = 0 " Not so much color

" :NERDTreeTabs
nnoremap <leader>d :NERDTreeTabsToggle<CR>
nnoremap <leader>f :NERDTreeTabsFind<CR>

" :CtrlP
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
" splliting right after helps preserver left nav
set splitright
" jump to exisiting buffer on any open command
let g:ctrlp_switch_buffer='ETVH'
" search for nearest ancestor like .git, .hg,
" else the directory of the current file
let g:ctrlp_working_path_mode = 'a'
" show the match window at the top of the screen
let g:ctrlp_match_window_bottom = 1
" enable caching
let g:ctrlp_use_caching = 1
" speed up by not removing clearing cache evertime
let g:ctrlp_clear_cache_on_exit=0
" show me dotfiles
let g:ctrlp_show_hidden = 1
" number of recently opened files
let g:ctrlp_mruf_max = 250
let g:ctrlp_max_depth = 7
let g:ctrlp_max_files = 30000

" :vim-smooth-scroll
" Normal mode
noremap <silent> <c-u> :call smooth_scroll#up(40, 20, 6)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(40, 20, 6)<CR>
" smooth_scroll is broken in visual mode currently - unmap
vnoremap <silent> <c-u> <c-u>
vnoremap <silent> <c-d> <c-d>










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


" markdown with fenced code gets marked
au BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = [
  \ 'css',
  \ 'erb=eruby',
  \ 'javascript',
  \ 'js=javascript',
  \ 'json=javascript',
  \ 'ruby',
  \ 'sass',
  \ 'xml',
  \ 'html',
  \ 'sh' ]
