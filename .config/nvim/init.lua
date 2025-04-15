--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- Set to true if you have a Nerd Font installed and selected in the terminal
-- Here is a nerdfont symbol: 
vim.g.have_nerd_font = true

-- disable EditorConfig and don't read `.editorconfig` files
vim.g.editorconfig = false

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'
-- vim.opt.colorcolumn = '80'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false
vim.opt.relativenumber = true

-- Line wrap settings
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.linebreak = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- `zg` to add the word to the spellfile
-- `z=` to get spelling suggestions
vim.opt.spell = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

vim.opt.swapfile = false

-- Don't have `o` add a comment
vim.opt.formatoptions:remove 'o'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 5

-- See `:help 'confirm'`
vim.opt.confirm = true

vim.opt.foldmethod = 'expr'
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldnestmax = 4
vim.opt.foldcolumn = '0'

-- show the first line of the fold
vim.opt.foldtext = "v:folddashes.substitute(getline(v:foldstart),'/\\*\\|\\*/\\|{{{\\d\\=','','g')"

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true, desc = '[W]rite to file' })
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = '[Y]ank into system clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = '[D]elete without replacing buffer' })
vim.keymap.set('n', '<leader>e', vim.cmd.Ex, { desc = '[e]xplore directory' })

-- this will open netrw in a new tab in the directory containing the file whose buffer you're in
vim.keymap.set('n', '<leader>E', ':tabedit %:p:h<CR>', { desc = '[E]xplore directory in a new tab' })
-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<leader><Esc>', '<cmd>nohlsearch<CR>', { desc = 'Stop highlighting search' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [e]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [q]uickfix list' })

-- Tmux style 'zoom' (`CTRL-W c` to close)
vim.keymap.set('n', '<leader>z', ':tab split<CR>', { desc = '[Z]oom window (new tab)' })

local set = vim.opt_local
-- set local settings for terminal buffers
vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', {}),
  callback = function()
    set.number = false
    set.relativenumber = false
    set.scrolloff = 0
    set.spell = false
  end,
})
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<C-[><C-[>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Open a terminal at the bottom of the screen with a fixed height.
-- local term_win_bufnr = nil
local term_win = nil
local channel_id = 0
vim.keymap.set('n', ',st', function()
  -- if term_win then
  if term_win and vim.api.nvim_win_is_valid(term_win) then
    vim.api.nvim_set_current_win(term_win)
    -- vim.api.nvim_win_set_height(0, 12)
    vim.cmd 'startinsert'
  else
    vim.cmd.new()
    -- put it at the bottom
    vim.cmd.wincmd 'J'
    vim.api.nvim_win_set_height(0, 12)
    vim.wo.winfixheight = true
    vim.cmd.term()
    term_win = vim.api.nvim_get_current_win()
    channel_id = vim.bo.channel
  end
end)
vim.keymap.set('n', ',mt', function()
  vim.fn.chansend(channel_id, { 'mix test\r\n' })
end)

vim.keymap.set('n', ',gf', ':lua OpenFileInPaneAbove()<CR>', { desc = 'Open file in pane above' })
function OpenFileInPaneAbove()
  -- get the file path under the cursor
  local file_path = vim.fn.expand '<cfile>'
  -- get the file path, line number, and column number under the cursor

  -- move to the window above
  vim.cmd 'wincmd k'

  vim.cmd 'normal gF'
  vim.cmd('edit ' .. file_path)
end

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

vim.api.nvim_create_autocmd('VimEnter', {
  desc = 'Startup in :Explore mode',
  pattern = '*',
  callback = function()
    if vim.fn.expand '%' == '' then
      vim.cmd 'Explore'
    end
  end,
})

vim.api.nvim_create_autocmd('TermOpen', {
  desc = 'Start :term in insert mode',
  pattern = '*',
  command = 'startinsert | set winfixheight',
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
if vim.g.vscode then
  require 'vscode-plugins'
else
  require 'lazy-plugins'
end

-- vim: ts=2 sts=2 sw=2 et
