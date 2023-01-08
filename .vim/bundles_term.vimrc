" -----------------------------------------------------
" Colorschemes
" -----------------------------------------------------

Plug 'AlessandroYorba/Despacio'
Plug 'danilo-augusto/vim-afterglow'
Plug 'morhetz/gruvbox'
Plug 'romainl/Apprentice'
Plug 'arcticicestudio/nord-vim'

" -----------------------------------------------------
" Language agnostic plugins
" -----------------------------------------------------

Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Better display for messages
  set cmdheight=2

  " You will have bad experience for diagnostic messages when it's default 4000.
  set updatetime=300

  " don't give |ins-completion-menu| messages.
  set shortmess+=c

  " always show signcolumns
  set signcolumn=yes


  " Formatting selected code.
  xmap <leader>f  <Plug>(coc-format)
  nmap <leader>f  <Plug>(coc-format)

  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocAction('format')

  " Use tab for trigger completion with characters ahead and navigate.
  " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }

" Plug 'w0rp/ale'
  " let g:ale_fixers = ['trim_whitespace', 'remove_trailing_lines', 'trim_whitespace']
  " let g:ale_sign_warning = '--'
  " let g:ale_sign_error = '>>'
  " highlight clear ALEWarningSign
  " let g:ale_echo_msg_format = '[%linter%] %s'
  " let g:ale_python_pylint_change_directory = 0
  " nnoremap <leader><C-k> :ALEPreviousWrap<CR>
  " nnoremap <leader><C-j> :ALENextWrap<CR>
  " nnoremap <leader>F :ALEFix<CR>
  " let g:ale_set_loclist=0
  " let g:ale_set_quickfix=0
  " let g:ale_lint_on_insert_leave=1
  " let g:ale_lint_on_enter=0
  " let g:ale_lint_on_filetype_changed=0


Plug 'junegunn/rainbow_parentheses.vim'
  autocmd VimEnter * RainbowParentheses
  let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

Plug 'gavinbeatty/dragvisuals.vim'
  vmap  <expr>  <LEFT>   DVB_Drag('left')
  vmap  <expr>  <RIGHT>  DVB_Drag('right')
  vmap  <expr>  <DOWN>   DVB_Drag('down')
  vmap  <expr>  <UP>     DVB_Drag('up')
  let g:DVB_TrimWS = 1  " Remove any introduced trailing whitespace after moving

" if has('nvim')
"   " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"   " let g:deoplete#enable_at_startup = 1
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif

Plug 'junegunn/goyo.vim'
function! ProseMode()
  silent !tmux set status off
  call goyo#execute(0, [])
  set spell noci nosi noai nolist noshowmode noshowcmd
  set linebreak
  set complete+=s
  set bg=light
  highlight SpecialKey ctermbg=NONE

  " match Error /\%81v/
endfunction

command! ProseMode call ProseMode()
" pip install proselint
nmap \p :ProseMode<CR>

" -----------------------------------------------------
" External tools intergration plugins
" -----------------------------------------------------

Plug 'airblade/vim-gitgutter'
  " Jump between hunks with [c and ]c
  set updatetime=100

Plug 'tpope/vim-fugitive'
  nnoremap <leader>gs :Gstatus<CR>
  nnoremap <leader>gc :Gcommit -v -q<CR>
  nnoremap <leader>gd :Gdiff<CR>
  nnoremap <leader>gr :Git grok<CR>

" -----------------------------------------------------
" Swift
" -----------------------------------------------------

Plug 'keith/swift.vim', { 'for': 'swift' }

" -----------------------------------------------------
" Rust
" -----------------------------------------------------

Plug 'rust-lang/rust.vim', { 'for': 'rs' }

" -----------------------------------------------------
" Javascript
" -----------------------------------------------------

Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
" Plug 'vim-scripts/JavaScript-Indent', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
  let g:jsx_ext_required = 0

Plug 'moll/vim-node', { 'for': ['javascript', 'javascript.jsx'] }
" Plug 'elmcast/elm-vim', { 'for': ['elm'] }
"   let g:elm_setup_keybindings = 0
" Plug 'digitaltoad/vim-pug', { 'for': ['pug'] }
" Plug 'autozimu/LanguageClient-neovim', {
"       \ 'branch': 'next',
"       \ 'do': 'bash install.sh',
"       \ }
" let g:LanguageClient_serverCommands = {
"       \ 'reason': ['/absolute/path/to/reason-language-server.exe']
"       \ }

" -----------------------------------------------------
" HTML/CSS
" -----------------------------------------------------

Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'sass' }
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

" indentLine messes with conceal, and hides quotes in JSON files.
" https://github.com/Yggdroot/indentLine/issues/140
Plug 'Yggdroot/indentLine'
  let g:indentLine_char = '▏'
Plug 'scrooloose/nerdtree'
  let NERDTreeMinimalUI = 1 " not so much cruft
  let NERDTreeShowHidden = 1 " Should hidden files
  let NERDTreeShowLineNumbers = 0
  let NERDTreeIgnore=['\.DS_Store']
  let NERDTreeShowBookmarks = 0
  let NERDTreeWinSize = 20
  let NERDTreeAutoDeleteBuffer=1
  hi def link NERDTreeRO Normal
  hi def link NERDTreePart StatusLine
  hi def link NERDTreeDirSlash Directory
  hi def link NERDTreeCurrentNode Search
  hi def link NERDTreeCWD Normal
  nnoremap <leader>d :NERDTreeToggle<CR>

Plug 'terryma/vim-smooth-scroll'
  " Normal mode
  noremap <silent> <c-u> :call smooth_scroll#up(40, 20, 6)<CR>
  noremap <silent> <c-d> :call smooth_scroll#down(40, 20, 6)<CR>
  " smooth_scroll is broken in visual mode currently - unmap
  vnoremap <silent> <c-u> <c-u>
  vnoremap <silent> <c-d> <c-d>

" let g:LanguageClient_serverCommands = {
"     \ 'reason': ['/usr/local/bin/reason-language-server.exe'],
"     \ }
" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> gf :call LanguageClient_textDocument_formatting()<cr>
" let g:deoplete#enable_at_startup = 1
