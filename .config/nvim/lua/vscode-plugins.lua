-- VSCode extentions
require("lazy").setup({
	"tpope/vim-surround",
	{ "numToStr/Comment.nvim", opts = {} },
}, {})

vim.keymap.set("n", "<leader>w", function()
	require("vscode-neovim").action("workbench.action.files.save")
end)

vim.keymap.set("n", "<leader>f", function()
	require("vscode-neovim").action("editor.action.formatDocument")
end)

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
require("vscode-plugins")

-- vim: ts=2 sts=2 sw=2 et
