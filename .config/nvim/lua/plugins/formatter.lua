return {
  "mhartington/formatter.nvim",
  config = function()
    require("formatter").setup {
      logging = true,
      log_level = vim.log.levels.WARN,
      filetype = {
        ruby = {
				  require("formatter.filetypes.ruby").standardrb
				},
				python = {
				  require("formatter.filetypes.python").black,
        }
      }
    }
  end
}
