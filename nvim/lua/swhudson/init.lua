require("swhudson.remap")
require("swhudson.lint")
require("swhudson.lualine")
require("ibl").setup()
require("mason").setup()
require('gitsigns').setup()

-- GLOBAL OPTS --
-- troubleshooting vim/tmux colors
-- https://gist.github.com/andersevenrud/015e61af2fd264371032763d4ed965b6
vim.o.termguicolors = true
vim.cmd[[colorscheme dracula]]

vim.wo.relativenumber = true
vim.wo.number = true

vim.api.nvim_set_option('clipboard', 'unnamedplus')

-- autoreload buffers
--
vim.o.autoread = true
vim.api.nvim_exec([[
  autocmd FocusGained * checktime
]], false)

