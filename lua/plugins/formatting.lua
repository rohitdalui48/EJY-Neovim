return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				--coding
				lua = { "stylua" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				python = { "black" },
				bash = { "beautysh" },
				--notes
				md = { "mdformat" },
				--web-dev
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
