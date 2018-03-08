" -----------------------------------------------------
" Colorschemes
" -----------------------------------------------------

Plug 'AlessandroYorba/Despacio'
Plug 'danilo-augusto/vim-afterglow'
Plug 'morhetz/gruvbox'
Plug 'romainl/Apprentice'

" -----------------------------------------------------
" Language agnostic plugins
" -----------------------------------------------------

Plug 'w0rp/ale'
  let g:ale_sign_warning = '--'
  let g:ale_sign_error = '>>'
  highlight clear ALEWarningSign
  let g:ale_echo_msg_format = '[%linter%] %s'
  " nmap <silent> <C-k> :ale_previous_wrap
  nnoremap <leader><C-k> :ALEPreviousWrap<CR>
  nnoremap <leader><C-j> :ALENextWrap<CR>

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'arithran/vim-delete-hidden-buffers'
Plug 'mbbill/undotree'
Plug 'unblevable/quick-scope'
  let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

Plug 'junegunn/rainbow_parentheses.vim'
  " let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
  " let g:rainbow#blacklist = [180, 208, 230, 216, 109, 233]
  augroup rainbow_js
    autocmd!
    autocmd FileType * RainbowParentheses
  augroup END

Plug 'gavinbeatty/dragvisuals.vim'
  vmap  <expr>  <LEFT>   DVB_Drag('left')
  vmap  <expr>  <RIGHT>  DVB_Drag('right')
  vmap  <expr>  <DOWN>   DVB_Drag('down')
  vmap  <expr>  <UP>     DVB_Drag('up')
  let g:DVB_TrimWS = 1  " Remove any introduced trailing whitespace after moving

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
  " use tab for completion
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

Plug 'junegunn/goyo.vim'
function! ProseMode()
  call goyo#execute(0, [])
  set spell noci nosi noai nolist noshowmode noshowcmd
  set complete+=s
  set bg=light
  highlight SpecialKey ctermbg=NONE

  match Error /\%81v/
endfunction
command! ProseMode call ProseMode()
nmap \p :ProseMode<CR>

" -----------------------------------------------------
" External tools intergration plugins
" -----------------------------------------------------

Plug 'airblade/vim-gitgutter'
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
Plug 'vim-scripts/JavaScript-Indent', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
  let g:jsx_ext_required = 0

Plug 'moll/vim-node', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'elmcast/elm-vim', { 'for': ['elm'] }
  let g:elm_setup_keybindings = 0
Plug 'digitaltoad/vim-pug', { 'for': ['pug'] }

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

Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
  nnoremap <leader>t :Files<CR>
  nnoremap <leader>b :Buffers<CR>
  nnoremap <leader>r :Tags<CR>

" adds `:Rg` command for quick search (ALT-A to select all, ALT-D to deselect all)
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

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
