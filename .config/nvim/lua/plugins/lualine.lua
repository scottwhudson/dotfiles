return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = { theme = "tokyonight" },
			sections = {
				lualine_a = {
					{
						"buffers",
						show_filename_only = true,
					},
				},
				lualine_c = {
					{
						"filename",
						path = 1,
						color = function(section)
							return {
								fg = vim.bo.modified and "#282A36" or "#F8F8F2",
								bg = vim.bo.modified and "#FF5555" or "#44475A",
							}
						end,
					},
				},
			},
		})
	end,
}
