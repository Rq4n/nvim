return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	event = "VeryLazy",

	config = function()
		require("lualine").setup({
			options = {
				theme = "rose-pine",
				section_separators = "",
				component_separators = "",
				globalstatus = true,
			},

			sections = {
				lualine_a = {
					"mode",
				},

				lualine_b = {
					"branch",
					"diff",
				},

				lualine_c = {
					"filename",
				},

				lualine_x = {
					"diagnostics",
					"encoding",
					"filetype",
				},

				lualine_y = {
					"progress",
				},
				lualine_z = {
					{
						function()
							return os.date("%H:%M")
						end,
					},
				},
			},
		})
	end,
}
