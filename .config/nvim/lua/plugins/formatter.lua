return {
	"mhartington/formatter.nvim",
	config = function()
		require("formatter").setup({
			logging = true,
			log_level = vim.log.levels.DEBUG,
			filetype = {
				lua = {
					require("formatter.filetypes.lua").stylua,
				},
				ruby = {
					require("formatter.filetypes.ruby").standardrb,
				},
				python = {
					require("formatter.filetypes.python").black,
				},
				["*"] = {
					-- "formatter.filetypes.any" defines default configurations for any
					-- filetype
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
		})
	end,
}
