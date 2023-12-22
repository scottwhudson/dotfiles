require("swhudson.remap")
require("swhudson.lint")

require('gitsigns').setup()
require('lualine').setup {
  options = { theme = 'dracula' },
  sections = { 
    lualine_c = {
      {
	'filename',
	path = 1,
	color = function(section)
	  return {
            fg = vim.bo.modified and '#282A36' or '#F8F8F2',
            bg = vim.bo.modified and '#FF5555' or '#44475A' 
          }
	end
      }
    }
  }
}


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

require("ibl").setup()
require("mason").setup()

require('lint').linters_by_ft = {
  ruby = {'standardrb'}
}
