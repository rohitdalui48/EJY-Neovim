return {
	"neovim/nvim-lspconfig",
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities() --for auto-complitions
		--lanugae Servers

		--lua-ls for lua
		vim.lsp.config["lua_ls"] = {
			cmd = { "lua-language-server" },
			filetypes = { "lua" },
			capabilities = capabilities,
		}

		--clangd for c and cpp
		vim.lsp.config["clangd"] = {
			cmd = { "clangd" },
			filetypes = { "c", "cpp" },
			capabilities = capabilities,
		}

		--marksman for markdown
		vim.lsp.config["marksman"] = {
			cmd = { "marksman" },
			filetypes = { "md" },
			capabilities = capabilities,
		}

		--python-lsp-server for python
		vim.lsp.config["pylsp"] = {
			cmd = { "pylsp" },
			filetypes = { "python" },
			capabilities = capabilities,
		}

		--web-developemnt

		--html-server for python
		vim.lsp.config["superhtml"] = {
			cmd = { "superhtml", "lsp" },
			filetypes = { "html" },
			capabilities = capabilities,
		}
		--emmet-laguage-server for html
		vim.lsp.config["emmet-language-server"] = {
			cmd = { "emmet-language-server", "--stdio" },
			filetypes = { "html" },
			capabilities = capabilities,
		}
		--css-laguage-server for html
		vim.lsp.config["vscode-css-language-server"] = {
			cmd = { "vscode-css-language-server", "--stdio" },
			filetypes = { "html", "css" },
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
		})

		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
		vim.keymap.set("n", "<leader>grn", vim.lsp.buf.rename, { desc = "Global Rename" })
	end,
}
