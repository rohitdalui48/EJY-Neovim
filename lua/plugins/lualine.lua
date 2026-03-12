return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	priority = 1000,
	config = function()
		require("lualine").setup({
			options = {
				theme = "base16",
				section_separators = { left = "", right = "" },
				component_separators = { left = "-", right = "-" },
			},
		})
	end,
}
