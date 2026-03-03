return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {

			-- Linters
			lua = { "luacheck" },
			c = { "cpplint" },
			cpp = { "cpplint" },
			python = { "ruff" },

			--Web-Development
			html = { "htmlhint", "stylelint" },
			css = { "stylelint" },
		}

		lint.linters.cpplint.args = {
			"--filter=-whitespace,-legal,-readability",
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				if vim.bo.modifiable then
					lint.try_lint()
				end
			end,
		})
		vim.diagnostic.config({
			virtual_text = true,
		})
	end,
}
