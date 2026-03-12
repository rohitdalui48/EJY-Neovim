return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		languages = {
			--Coding
			"lua",
			"c",
			"cpp",
			"python",
			"bash",
			-- Web Development
			"html",
			"html_tags",
			"htmldjango",
			"css",
			"javascript",
		}
		fileTypes = {
			--Coding
			"lua",
			"c",
			"cpp",
			"python",
			--Web Development
			"html",
			"css",
			"javascript",
		}
		require("nvim-treesitter").install(languages)
		vim.api.nvim_create_autocmd("FileType", {
			pattern = fileTypes,
			callback = function()
				vim.treesitter.start()
				vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
				vim.wo[0][0].foldmethod = "expr"
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
