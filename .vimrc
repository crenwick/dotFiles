set ruler laststatus=2 number title hlsearch history=1000
set shiftwidth=2 autoindent smartindent smarttab expandtab tabstop=2

" highlight matching {[()]}
set showmatch

" start scrolling when within 5 lines near the top or bottom
set scrolloff=5
set sidescroll=1
set list
set listchars=""
set listchars=tab:\ \
set listchars+=trail:.
set tabpagemax=50

" highlight last inserted text
nnoremap gV `[v`]

" allow buffer to be hideen within writing to disk
set hidden

let mapleader=","
" append a semicolon to the line
nnoremap <leader>; $a;<Esc>

syntax on

" highlight the 81st character in each line
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" automatically reload vimrc when its saved
au BufWritePost .vimrc so ~/.vimrc

" load pathogen
execute pathogen#infect()
" oepn NERDTree automatically when vim starts
autocmd vimenter * NERDTree
