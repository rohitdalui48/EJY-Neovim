return {
	"neovim/nvim-lspconfig",
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities() --for auto-complitions

		--coding
		vim.lsp.config["lua_ls"] = {
			cmd = { "lua-language-server" },
			filetypes = { "lua" },
			capabilities = capabilities,
		}
		vim.lsp.config["clangd"] = {
			cmd = { "clangd" },
			filetypes = { "c", "cpp" },
			capabilities = capabilities,
		}
		vim.lsp.config["pylsp"] = {
			cmd = { "pylsp" },
			filetypes = { "python" },
			capabilities = capabilities,
		}
		vim.lsp.config["bash-language-server"] = {
			cmd = { "bash-language-server", "start" },
			filetypes = { "bash", "sh", "zsh" },
			capabilities = capabilities,
		}
		--notes
		vim.lsp.config["marksman"] = {
			cmd = { "marksman" },
			filetypes = { "md" },
			capabilities = capabilities,
		}
		--web-developemnt
		vim.lsp.config["superhtml"] = {
			cmd = { "superhtml", "lsp" },
			filetypes = { "html" },
			capabilities = capabilities,
		}
		vim.lsp.config["emmet-language-server"] = {
			cmd = { "emmet-language-server", "--stdio" },
			filetypes = { "html" },
			capabilities = capabilities,
		}
		vim.lsp.config["vscode-css-language-server"] = {
			cmd = { "vscode-css-language-server", "--stdio" },
			filetypes = { "html", "css" },
			capabilities = capabilities,
		}
		vim.lsp.config["typescript-language-server"] = {
			cmd = { "typescript-language-server", "--stdio" },
			filetypes = { "javascript" },
			capabilities = capabilities,
		}

		--enabled servers
		vim.lsp.enable({
			"lua_ls",
			"clangd",
			"marksman",
			"pylsp",
			"superhtml",
			"emmet-language-server",
			"vscode-css-language-server",
			"typescript-language-server",
			"bash-language-server",
		})

		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
		vim.keymap.set("n", "<leader>grn", vim.lsp.buf.rename, { desc = "Global Rename" })
	end,
}
