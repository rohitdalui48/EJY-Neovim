return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	priority = 1000,
	config = function()
		local custom_dracula = require("lualine.themes.dracula")
		require("lualine").setup({
			options = {
				theme = custom_dracula,
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
			},
		})
	end,
}
