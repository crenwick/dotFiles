" -----------------------------------------------------
" Colorschemes
" -----------------------------------------------------

" Plug 'https://github.com/ajh17/Spacegray.vim'
Plug 'AlessandroYorba/Despacio'

" -----------------------------------------------------
" Language agnoustic
" -----------------------------------------------------

Plug 'benekastah/neomake', { 'on': ['Neomake'] }
  let g:neomake_error_sign = {
      \ 'text': '⌦',
      \ 'texthl': 'ErrorMsg',
      \ }

  let g:neomake_warning_sign = {
      \ 'text': '㋡',
      \ 'texthl': 'WarningMsg',
      \ }
  hi WarningMsg ctermfg=3 ctermbg=18
  hi ErrorMsg ctermfg=1 ctermbg=18
  let g:neomake_javascript_enabled_makers = ['eslint']
  let g:neomake_jsx_enabled_makers = ['eslint']
  let g:neomake_python_python_exe = 'python3'
  autocmd! BufWritePost * Neomake

  " Configure a nice credo setup, courtesy https://github.com/neomake/neomake/pull/300
  let g:neomake_elixir_enabled_makers = ['mycredo']
  function! NeomakeCredoErrorType(entry)
    if a:entry.type ==# 'F'      " Refactoring opportunities
      let l:type = 'W'
    elseif a:entry.type ==# 'D'  " Software design suggestions
      let l:type = 'I'
    elseif a:entry.type ==# 'W'  " Warnings
      let l:type = 'W'
    elseif a:entry.type ==# 'R'  " Readability suggestions
      let l:type = 'I'
    elseif a:entry.type ==# 'C'  " Convention violation
      let l:type = 'W'
    else
      let l:type = 'M'           " Everything else is a message
    endif
    let a:entry.type = l:type
  endfunction

  let g:neomake_elixir_mycredo_maker = {
    \ 'exe': 'mix',
    \ 'args': ['credo', 'list', '%:p', '--format=oneline'],
    \ 'errorformat': '[%t] %. %f:%l:%c %m,[%t] %. %f:%l %m',
    \ 'postprocess': function('NeomakeCredoErrorType')
    \ }

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

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1
  " use tab for completion
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

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
" Rust
" -----------------------------------------------------

Plug 'rust-lang/rust.vim'

" -----------------------------------------------------
" Javascript
" -----------------------------------------------------

Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'vim-scripts/JavaScript-Indent', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
  let g:jsx_ext_required = 0

Plug 'jordwalke/VimJSDocSnippets', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'moll/vim-node', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'elmcast/elm-vim', { 'for': ['elm'] }
Plug 'digitaltoad/vim-pug', { 'for': ['pug'] }

" -----------------------------------------------------
" HTML/CSS
" -----------------------------------------------------

Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
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

Plug 'scrooloose/nerdtree'
  let g:NERDTreeMinimalUI = 1 " not so much cruft
  let g:NERDTreeShowHidden = 1 " Should hidden files
  let g:NERDTreeShowLineNumbers = 1
  let g:NERDTreeIgnore=['\.DS_Store']
  let g:NERDTreeShowBookmarks = 0
  hi def link NERDTreeRO Normal
  hi def link NERDTreePart StatusLine
  hi def link NERDTreeDirSlash Directory
  hi def link NERDTreeCurrentNode Search
  hi def link NERDTreeCWD Normal

Plug 'jistr/vim-nerdtree-tabs'
  nnoremap <leader>d :NERDTreeTabsToggle<CR>
  nnoremap <leader>f :NERDTreeTabsFind<CR>
  let g:nerdtree_tabs_open_on_console_startup = 2
  " open only if directory was given as startup argument

Plug 'kien/ctrlp.vim', { 'on': ['CtrlP', 'CtrlPClearCache'] }
  nnoremap <leader>t :CtrlP<CR>
  nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
  noremap <C-h> <C-w>h

" -----------------------------------------------------
" Dependencies
" -----------------------------------------------------

Plug 'tpope/vim-repeat'
