" -----------------------------------------------------
" Options
" -----------------------------------------------------

set nocompatible      " not compatible with vi
set autoindent        " automatically set indent of new line
set autoread          " reload files when changed on disk
set backspace=indent,eol,start
                      " Allow backspace beyond insertion point
set complete-=i       " Set completion results with things that are useful

set title             " Set terminal title
set ruler             " Show where you are
set history=1000

" Tab control
set softtabstop=2     " insert mode tab and backspace uses 2 spaces
set shiftwidth=2      " normal mode indentation commands uses 2 spaces
set expandtab         " expand tabs to spaces
set smarttab          " 'tab' according the the file usage
set tabstop=2         " actual tab uses 8 spaces

set mouse=a           " click tabs, drag tabs, and drag split bars
if has("mouse_sgr")
  set ttymouse=sgr
end
set clipboard=unnamed " yank and paste with the system clipboard

set directory-=.      " don't store swapfiles in the current directory
set list              " show trailing whitespace
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set tabpagemax=50
set showcmd           " show current command going on

" code folding settings
set foldmethod=indent
set nofoldenable      " Remove ugly folds
set diffopt=filler,context:9999 "nofold in diff mode

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
set sidescroll=5
set display+=lastline

" set shell=/bin/bash\ -li
" fix shell?
" if &shell =~# 'fish$'
"   set shell=sh
" endif
set shell=$SHELL

" Searching
set ignorecase        " case-insensitive search
set smartcase         " case-sensitive search if any caps
set hlsearch
set incsearch         " search as you type

set path+=**          " Search down into subfolders
" - Hit tab to :find by partial math
" - Use * to make it fuzzy
" - :b lets autocomplete work in any open buffer

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

" Theme
set encoding=utf8
" let base16colorspace=256
set t_Co=256          " explicitly tell vim the terminal supports 256
set number            " show the current line number

set smartindent

set noswapfile        " Don't make backups.
set nowritebackup     " Even if you did make a backup, don't keep it around.
set nobackup

set laststatus=2      " always show status

" stackoverflow.com/questions/6852763/vim-quickfix-list-launch-files-in-new-tab
set switchbuf+=usetab,newtab

" Configure as Privacy plugin
" All sensitive data is not stored in your ~/.vimrc folder
" Configure the spelling language and file.
set spelllang=en
set spellfile=$HOME/vim_spell/en.utf-8.add

" -----------------------------------------------------
" Snippets
" -----------------------------------------------------

nnoremap ,html :-1read $HOME/.vim/snippets/skeleton.html<CR>3jwf>a
nnoremap ,defmod :-1read $HOME/.vim/snippets/skeleton.defmodule.ex<CR>ela
nnoremap ,mdoc :-1read $HOME/.vim/snippets/skeleton.moduledoc.ex<CR>jA

let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" -----------------------------------------------------
" Plugins
" -----------------------------------------------------

call plug#begin()

source $HOME/.vim/bundles_core.vimrc

" if has('g:vscode_channel')
" else
  source $HOME/.vim/bundles_term.vimrc
" end

call plug#end()

" -----------------------------------------------------
" Key Maps
" -----------------------------------------------------

" Turn off linewise keys. Normally, the `j' and `k' keys move the cursor down one entire line. with
" line wrapping on, this can cause the cursor to actually skip a few lines on the screen because
" it's moving from line N to line N+1 in the file. I want this to act more visually -- I want `down'
" to mean the next line on the screen
nmap j gj
nmap k gk

" hjkl keys navigate buffer splits
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" to save all files
nnoremap <Leader>w :wa<CR>

" enter visual line mode:
nmap <Leader><Leader> V

" send last command to last tmux pane
nmap \r :!tmux send-keys -t {last} Up Enter <CR><CR>
nmap \c :!tmux send-keys -t {last} C-C <CR><CR>

" Tag Jumping:
command! MakeTags !ctags -R .
" Create the `tags` file (requires ctags)
" - Use ^] to jump to tag under cursor
" - Use g^] for a list of tags under cursor
" - Use ^t to jump back up the tag stack

command! Reload :source $MYVIMRC

" Get rid of trailing whitespace
nnoremap <leader>WS :%s/\s\+$//<CR>

" buffer nav shortcuts
nnoremap <leader>H :bn<CR>
nnoremap <leader>L :bp<CR>

if has('nvim')
  let g:python_host_prog = '/Users/crenwick/.pyenv/versions/neovim2/bin/python'
  let g:python3_host_prog = '/Users/crenwick/.pyenv/versions/neovim3/bin/python'

  " nvim-terminal-emulator
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l

  set ttimeout        " wait for a mapping sequence to complete
  set ttimeoutlen=100
  set inccommand=nosplit
endif

" These are things that I mistype and want ignored or fixed.
nmap q: <silent>
cabbrev Q q
cabbrev Vsp vsp
cabbrev Wq wq

filetype plugin indent on

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

" -----------------------------------------------------
" UI
" -----------------------------------------------------

" let g:despacio_Midnight = 1
colorscheme apprentice
let g:nord_cursor_line_number_background = 1

syntax on             " enable syntax highlighting

" highlight the 80st character in each line
autocmd BufWinEnter * let w:m2=matchadd('SpellCap', '\%81v.', -1)

" highlight trailing whitespace
autocmd BufWinEnter * let w:m3=matchadd('ErrorMsg', '\s\+$', -1)

" -----------------------------------------------------
" FILE TYPE TRIGGERS
" -----------------------------------------------------

au BufNewFile,BufRead *.html          setlocal nocindent smartindent
au BufNewFile,BufRead *.es6           set ft=javascript
au BufNewFile,BufRead *.json          set ft=json
au BufNewFile,BufRead *.bash_profile  set ft=sh
au BufNewFile,BufRead *.bashrc        set ft=sh
au BufNewFile,BufRead Fastfile        set ft=ruby

" packloadall
silent! helptags ALL

" don't hide double quotes is JSON
set conceallevel=0

if exists('g:gui_oni')
  " If using Oni's externalized statusline, hide vim's native statusline
  set noshowmode
  set noruler
  set laststatus=0
  set noshowcmd
endif
