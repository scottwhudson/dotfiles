vim.g.mapleader = " "
-- Keys
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("i", "bb", "binding.b")

-- window mvt
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- terminal
vim.keymap.set("t", "<C-h>", "<cmd>wincmd h<CR>")
vim.keymap.set("t", "<C-j>", "<cmd>wincmd j<CR>")
vim.keymap.set("t", "<C-k>", "<cmd>wincmd k<CR>")
vim.keymap.set("t", "<C-l>", "<cmd>wincmd l<CR>")
vim.keymap.set("n", "<leader>j", ":terminal")
-- Commands
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>t", vim.cmd.TestNearest)
vim.keymap.set("n", "<leader>T", vim.cmd.TestFile)
