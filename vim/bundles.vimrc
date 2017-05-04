" -----------------------------------------------------
" Colorschemes
" -----------------------------------------------------

" Collection of Clean Vim ColorSchemes with Airline Themes
Plug 'jordwalke/VimCleanColors'

" Solarized
Plug 'git://github.com/altercation/vim-colors-solarized'
" default value is 1
let g:solarized_underline=0
" default value is 16
let g:solarized_termcolors=256
" default value is normal
let g:solarized_contrast='high'
" default value is normal
let g:solarized_visibility='high'

" Flatlandia (for MacVim)
Plug 'git://github.com/jordwalke/flatlandia'

" Web Dev Icons
Plug 'https://github.com/ryanoasis/vim-webdevicons'
let g:WebDevIconsUnicodeDecorateFolderNodes = 0
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '

Plug 'https://github.com/ajh17/Spacegray.vim'

" -----------------------------------------------------
" Language agnostic plugins
" -----------------------------------------------------

" ACP Forked
Plug 'SirVer/ultisnips'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'gavinbeatty/dragvisuals.vim'
Plug 'jordwalke/AutoComplPop'
Plug 'unblevable/quick-scope'

" -----------------------------------------------------
" Swift
" -----------------------------------------------------

Plug 'keith/swift.vim', { 'for': 'swift' }

" -----------------------------------------------------
" Javascript
" -----------------------------------------------------

Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'vim-scripts/JavaScript-Indent', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'jordwalke/VimJSDocSnippets', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'junegunn/rainbow_parentheses.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'moll/vim-node', { 'for': ['javascript', 'javascript.jsx'] }

" -----------------------------------------------------
" HTML/CSS
" -----------------------------------------------------

Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'tpope/vim-markdown', { 'for': 'markdown' }

" -----------------------------------------------------
" Elixir
" -----------------------------------------------------

Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }

" -----------------------------------------------------
" External tools intergration plugins
" -----------------------------------------------------

Plug 'tpope/vim-fugitive'

" -----------------------------------------------------
" Interface improvement
" -----------------------------------------------------

Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeFind', 'NERDTreeToggle', 'NERDTreeTabsToggle'] }
Plug 'jistr/vim-nerdtree-tabs', { 'on': ['NERDTreeTabsToggle'] }
Plug 'kien/ctrlp.vim', { 'on': ['CtrlP', 'CtrlPClearCache'] }

" Unite (Files, Buffers, Commands, etc. fuzzy searcher)
Plug 'Shougo/unite.vim'

" A lighterweight Powerline
Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1
set laststatus=2
" Disable truncation
let g:airline#extensions#default#section_truncate_width = {}

" Custom Resizing for SplitBalancer
Plug 'jordwalke/VimSplitBalancer'

" Visualize a tree of your document history
Plug 'http://github.com/sjl/gundo.vim.git'
nnoremap <D-U> :GundoToggle<CR>
let g:gundo_close_on_revert=1

Plug 'terryma/vim-smooth-scroll'

" -----------------------------------------------------
" Dependencies
" -----------------------------------------------------

" Async processing (for Unite)
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'tpope/vim-repeat'

" -----------------------------------------------------
" Other
" -----------------------------------------------------

" Bootstrap for Vim
Plug 'tpope/vim-sensible'
" AutoMakeDirectory if Needed
Plug 'jordwalke/VimAutoMakeDirectory'
" Thumbnail
Plug 'itchyny/thumbnail.vim'
" Go to Left when closing like everything else in the world
Plug 'jordwalke/VimCloser'
" SmartGUITabs
Plug 'jordwalke/MacVimSmartGUITabs'
" Make sure to have `set guioptions+=e` in your `.gvimrc`.
map <D-Cr> :SmartGUITabsToggleFullScreen<CR>
imap <D-Cr> <Esc>:SmartGUITabsToggleFullScreen<CR>
nmap <D-Cr> <Esc>:SmartGUITabsToggleFullScreen<CR>


" Combine Previous Plugins For Modern Completion Experience

" ciP  (change in paramater  - changes the single argument under cursor!
Plug 'git://github.com/vim-scripts/Parameter-Text-Objects.git'

