-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then error('Error cloning lazy.nvim:\n' .. out) end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- VSCode extentions
require('lazy').setup({
  'tpope/vim-surround',
  -- { 'numToStr/Comment.nvim', opts = {} },
}, {})

vim.keymap.set('n', '<leader>w', function() require('vscode-neovim').action 'workbench.action.files.save' end)

vim.keymap.set('n', '<leader>f', function() require('vscode-neovim').action 'editor.action.formatDocument' end)

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- vim: ts=2 sts=2 sw=2 et
