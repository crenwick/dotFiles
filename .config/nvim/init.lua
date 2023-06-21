local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- If packer doesn't exist, install it
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

-- packer stuff
vim.cmd [[packadd packer.nvim]]
require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'unblevable/quick-scope'
  use 'kassio/neoterm'
  use 'sbdchd/neoformat'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use { 'nvim-treesitter/nvim-treesitter',run = ':TSUpdate' }
  use 'nvim-lua/popup.nvim'
--  use 'folke/zen-mode.nvim'
end)

-- default options
opt.completeopt = "menuone,noselect"
opt.mouse = 'a'
opt.clipboard = 'unnamed'
opt.splitright = true
opt.splitbelow = true
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.number = true
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hidden = true
opt.cmdheight = 1
opt.signcolumn = 'yes'
opt.updatetime = 520
opt.undofile = true
cmd('filetype plugin indent on')
opt.backup = false
g.netrw_banner = false
g.netrw_liststyle = 3
g.markdown_fenced_languages = { 'javascript', 'js=javascript', 'json=javascript' }


g.mapleader = " "

map('n', '<leader><leader>', 'V')
map('n', '<leader>v', ':e $MYVIMRC<CR>')
map('n', '<leader>w', ':wa<CR>')
map('n', '<leader>H', ':bn<CR>')
map('n', '<leader>L', ':bp<CR>')

-- sbdchd/neoformat
map('n', '<leader>F', ':Neoformat prettier<CR>')

-- neovim/nvim-lspconfig
-- require'lspconfig'.tsserver.setup{}
-- map('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
-- map('n', 'gh', ':lua vim.lsp.buf.hover()<CR>')
-- map('n', 'gH', ':Telescope lsp_code_actions<CR>')
-- map('n', 'gD', ':lua vim.lsp.buf.implementation()<CR>')
-- map('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<CR>')
-- map('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
-- map('n', 'gR', ':lua vim.lsp.buf.rename()<CR>')


-- folke/zen-mode.nvim
-- require("zen-mode").setup {}
-- map('n', '<leader>z', ':ZenMode<CR>')
