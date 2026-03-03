return {
	{

		--auto-brackets
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		branch = "v0.6", --recommended as each new version will have breaking changes
		opts = {
			--Config goes here
		},
	},

	-- mini.ai
	{
		"nvim-mini/mini.nvim",
		version = false,
		config = function()
			require("mini.ai").setup()
		end,
	},

	-- mini.sa
	{
		"nvim-mini/mini.surround",
		version = false,
		config = function()
			require("mini.surround").setup()
		end,
	},

	--mini-files
	{
		"nvim-mini/mini.files",
		version = "*",
		config = function()
			require("mini.files").setup()
			vim.keymap.set("n", "<leader>e", "<cmd>lua MiniFiles.open()<CR>", { silent = true })
		end,
	},

	-- Float-term
	{
		"nvzone/floaterm",
		dependencies = "nvzone/volt",
		opts = {},
		cmd = "FloatermToggle",
		config = function()
			require("floaterm").setup()
		end,
	},

	--noice-cmdline
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},
}
