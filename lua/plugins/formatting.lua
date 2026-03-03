return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				md = { "mdformat" },
				python = { "black" },
				html = { "prettier" },
				css = { "prettier" },
				javascript = { "prettier" },
			},
		})
		vim.keymap.set("n", "<leader>F", conform.format, {})
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})
	end,
}
