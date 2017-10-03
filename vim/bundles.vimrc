" -----------------------------------------------------
" Colorschemes
" -----------------------------------------------------

" Plug 'https://github.com/ajh17/Spacegray.vim'
Plug 'AlessandroYorba/Despacio'

" -----------------------------------------------------
" Language agnostic plugins
" -----------------------------------------------------

" ACP Forked
Plug 'tpope/vim-commentary'
  vmap <Leader>c <c-_><c-_>
  vmap <Leader>C <c-_>b
  " mapping to `gc` doesn't toggle one visually selected line - only multiples.
  nmap <D-/> gc$

Plug 'tpope/vim-surround'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'unblevable/quick-scope'
Plug 'junegunn/rainbow_parentheses.vim'
  let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
  augroup rainbow_js
    autocmd!
    autocmd FileType python,elixir,eelixir,javascript,js,jsx,es6 RainbowParentheses
  augroup END

Plug 'gavinbeatty/dragvisuals.vim'
  vmap  <expr>  <LEFT>   DVB_Drag('left')
  vmap  <expr>  <RIGHT>  DVB_Drag('right')
  vmap  <expr>  <DOWN>   DVB_Drag('down')
  vmap  <expr>  <UP>     DVB_Drag('up')
  let g:DVB_TrimWS = 1  " Remove any introduced trailing whitespace after moving

Plug 'jordwalke/AutoComplPop'
  let g:acp_ignorecaseOption = 1

" -----------------------------------------------------
" External tools intergration plugins
" -----------------------------------------------------

Plug 'tpope/vim-fugitive'
  nnoremap <leader>gs :Gstatus<CR>

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
  let g:jsx_ext_required = 0

Plug 'jordwalke/VimJSDocSnippets', { 'for': ['javascript', 'javascript.jsx'] }
  let g:JSDocSnippetsMapping='<D-C>'

Plug 'moll/vim-node', { 'for': ['javascript', 'javascript.jsx'] }

" -----------------------------------------------------
" HTML/CSS
" -----------------------------------------------------

Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
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
    \ 'python',
    \ 'bash=sh',
    \ 'sh' ]

" -----------------------------------------------------
" Elixir
" -----------------------------------------------------

Plug 'elixir-lang/vim-elixir', { 'for': ['elixir', 'eelixir'] }

" -----------------------------------------------------
" Python
" -----------------------------------------------------

Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }

" -----------------------------------------------------
" Interface improvement
" -----------------------------------------------------

Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeFind', 'NERDTreeToggle', 'NERDTreeTabsToggle'] }
  let g:NERDTreeDirArrows = 1 " nice arrow
  let g:NERDTreeMinimalUI = 1 " not so much cruft
  let g:NERDTreeShowBookmarks = 1
  hi def link NERDTreeRO Normal
  hi def link NERDTreePart StatusLine
  hi def link NERDTreeDirSlash Directory
  hi def link NERDTreeCurrentNode Search
  hi def link NERDTreeCWD Normal
  let g:NERDChristmasTree = 0 " Not so much color

Plug 'jistr/vim-nerdtree-tabs', { 'on': ['NERDTreeTabsToggle'] }
  nnoremap <leader>d :NERDTreeTabsToggle<CR>
  nnoremap <leader>f :NERDTreeTabsFind<CR>
  " don't auto open NERDTree
  " let g:nerdtree_tabs_open_on_gui_startup = 1
  " let g:nerdtree_tabs_open_on_console_startup = 0

Plug 'kien/ctrlp.vim', { 'on': ['CtrlP', 'CtrlPClearCache'] }
  nnoremap <leader>t :CtrlP<CR>
  nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
  noremap <C-h> <C-w>h
  set splitright                      " splliting right after helps preserver left nav
  let g:ctrlp_switch_buffer='ETVH'    " jump to exisiting buffer on any open command
  let g:ctrlp_show_hidden = 1         " show me dotfiles
  let g:ctrlp_match_window_bottom = 1 " show the match window at the top of the screen

" Custom Resizing for SplitBalancer
Plug 'jordwalke/VimSplitBalancer'

" Visualize a tree of your document history
Plug 'http://github.com/sjl/gundo.vim.git'
nnoremap <D-U> :GundoToggle<CR>
let g:gundo_close_on_revert=1

Plug 'terryma/vim-smooth-scroll'
  " Normal mode
  noremap <silent> <c-u> :call smooth_scroll#up(40, 20, 6)<CR>
  noremap <silent> <c-d> :call smooth_scroll#down(40, 20, 6)<CR>
  " smooth_scroll is broken in visual mode currently - unmap
  vnoremap <silent> <c-u> <c-u>
  vnoremap <silent> <c-d> <c-d>

" -----------------------------------------------------
" Dependencies
" -----------------------------------------------------

" Async processing (for Unite)
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

