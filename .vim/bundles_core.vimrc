
" -----------------------------------------------------
" Language agnostic plugins
" -----------------------------------------------------

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'arithran/vim-delete-hidden-buffers'
Plug 'mbbill/undotree'
Plug 'unblevable/quick-scope'
  let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
  nnoremap <leader>t :Files<CR>
  nnoremap <leader>p :Commands<CR>
  nnoremap <leader>b :Buffers<CR>
  nnoremap <leader>r :Tags<CR>

" adds `:Rg` command for quick search (ALT-A to select all, ALT-D to deselect all)
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%', '?'),
      \   <bang>0)
autocmd FileType zfz matchdelete(w:m2)
