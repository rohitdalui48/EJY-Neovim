-- Options

-- Line Numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes:1"

-- Indentation
vim.opt.shiftwidth = 4
vim.opt.scrolljump = 1
vim.opt.sidescroll = 1
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.numberwidth = 4

-- Wrap Settings
vim.opt.wrap = true
vim.opt.wrapmargin = 5
vim.opt.smoothscroll = true

-- Mouse Settings
vim.opt.mouse = "nv"
vim.opt.mousefocus = true
vim.opt.mousehide = true

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Folds
vim.opt.foldmethod = expr
vim.opt.foldenable = false

-- Search Settings
vim.opt.ignorecase = true

-- Backup Bullshit
vim.opt.backup = false -- Don't create backup files
vim.opt.writebackup = false -- Don't backup before overwriting
vim.opt.swapfile = false
-- Keymaps

-- Leader Key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Saving File
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Write File" })
vim.keymap.set("n", "<leader>q", ":qw<CR>", { desc = "Write and Quit File" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit File" })

-- Splits
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split vertically" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split Horizontally" })

-- Split Focus
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Focus Left Pane" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Focus Above Pane" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Focus Bottom Pane" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Focus Right Pane" })

-- Split Resizing
vim.keymap.set("n", "<C-Left>", "<C-W><", { desc = "Increase Width" })
vim.keymap.set("n", "<C-Down>", "<C-W>-", { desc = "Decrease Width" })
vim.keymap.set("n", "<C-Up>", "<C-W>+", { desc = "Increase Height" })
vim.keymap.set("n", "<C-Right>", "<C-W>>", { desc = "Decrease Height" })

-- buffers
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous Buffer" })
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next Buffer" })

--Plugins

-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	spec = {

		-- plugins

		--Catppuccin Theme
		{
			"catppuccin/nvim",
			name = "catppuccin",
			priority = 1000,
			config = function()
				vim.cmd.colorscheme("catppuccin-mocha")
			end,
		},

		--Lualine
		{
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
		},

		--Snacks
		{
			"folke/snacks.nvim",
			dependencies = {
				"nvim-mini/mini.icons",
				"nvim-tree/nvim-web-devicons",
			},
			priority = 1000,
			lazy = false,
			---@type snacks.Config
			opts = {
				bigfile = { enabled = true },
				dashboard = { enabled = true },
				explorer = { enabled = true },
				indent = { enabled = true },
				input = { enabled = true },
				notifier = {
					enabled = true,
					timeout = 3000,
				},
				picker = { enabled = true },
				quickfile = { enabled = true },
				scope = { enabled = true },
				scroll = { enabled = true },
				statuscolumn = { enabled = true },
				words = { enabled = true },
				styles = {
					notification = {
						wo = { wrap = true }, -- Wrap notifications
					},
				},
			},
			keys = {
				-- Top Pickers & Explorer
				{
					"<leader><leader>",
					function()
						Snacks.picker.smart()
					end,
					desc = "Smart Find Files",
				},
				{
					"<leader>,",
					function()
						Snacks.picker.buffers()
					end,
					desc = "Buffers",
				},
				{
					"<leader>/",
					function()
						Snacks.picker.grep()
					end,
					desc = "Grep",
				},
				{
					"<leader>:",
					function()
						Snacks.picker.command_history()
					end,
					desc = "Command History",
				},
				{
					"<leader>n",
					function()
						Snacks.picker.notifications()
					end,
					desc = "Notification History",
				},
				-- {
				-- 	"<leader>e",
				-- 	function()
				-- 		Snacks.explorer()
				-- 	end,
				-- 	desc = "File Explorer",
				-- },
				-- find
				{
					"<leader>fb",
					function()
						Snacks.picker.buffers()
					end,
					desc = "Buffers",
				},
				{
					"<leader>fc",
					function()
						Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
					end,
					desc = "Find Config File",
				},
				{
					"<leader>ff",
					function()
						Snacks.picker.files()
					end,
					desc = "Find Files",
				},
				{
					"<leader>fg",
					function()
						Snacks.picker.git_files()
					end,
					desc = "Find Git Files",
				},
				{
					"<leader>fp",
					function()
						Snacks.picker.projects()
					end,
					desc = "Projects",
				},
				{
					"<leader>fr",
					function()
						Snacks.picker.recent()
					end,
					desc = "Recent",
				},
				-- git
				{
					"<leader>gb",
					function()
						Snacks.picker.git_branches()
					end,
					desc = "Git Branches",
				},
				{
					"<leader>gl",
					function()
						Snacks.picker.git_log()
					end,
					desc = "Git Log",
				},
				{
					"<leader>gL",
					function()
						Snacks.picker.git_log_line()
					end,
					desc = "Git Log Line",
				},
				{
					"<leader>gs",
					function()
						Snacks.picker.git_status()
					end,
					desc = "Git Status",
				},
				{
					"<leader>gS",
					function()
						Snacks.picker.git_stash()
					end,
					desc = "Git Stash",
				},
				{
					"<leader>gd",
					function()
						Snacks.picker.git_diff()
					end,
					desc = "Git Diff (Hunks)",
				},
				{
					"<leader>gf",
					function()
						Snacks.picker.git_log_file()
					end,
					desc = "Git Log File",
				},
				-- gh
				{
					"<leader>gi",
					function()
						Snacks.picker.gh_issue()
					end,
					desc = "GitHub Issues (open)",
				},
				{
					"<leader>gI",
					function()
						Snacks.picker.gh_issue({ state = "all" })
					end,
					desc = "GitHub Issues (all)",
				},
				{
					"<leader>gp",
					function()
						Snacks.picker.gh_pr()
					end,
					desc = "GitHub Pull Requests (open)",
				},
				{
					"<leader>gP",
					function()
						Snacks.picker.gh_pr({ state = "all" })
					end,
					desc = "GitHub Pull Requests (all)",
				},
				-- Grep
				{
					"<leader>sb",
					function()
						Snacks.picker.lines()
					end,
					desc = "Buffer Lines",
				},
				{
					"<leader>sB",
					function()
						Snacks.picker.grep_buffers()
					end,
					desc = "Grep Open Buffers",
				},
				{
					"<leader>sg",
					function()
						Snacks.picker.grep()
					end,
					desc = "Grep",
				},
				{
					"<leader>sw",
					function()
						Snacks.picker.grep_word()
					end,
					desc = "Visual selection or word",
					mode = { "n", "x" },
				},
				-- search
				{
					'<leader>s"',
					function()
						Snacks.picker.registers()
					end,
					desc = "Registers",
				},
				{
					"<leader>s/",
					function()
						Snacks.picker.search_history()
					end,
					desc = "Search History",
				},
				{
					"<leader>sa",
					function()
						Snacks.picker.autocmds()
					end,
					desc = "Autocmds",
				},
				{
					"<leader>sb",
					function()
						Snacks.picker.lines()
					end,
					desc = "Buffer Lines",
				},
				{
					"<leader>sc",
					function()
						Snacks.picker.command_history()
					end,
					desc = "Command History",
				},
				{
					"<leader>sC",
					function()
						Snacks.picker.commands()
					end,
					desc = "Commands",
				},
				{
					"<leader>sd",
					function()
						Snacks.picker.diagnostics()
					end,
					desc = "Diagnostics",
				},
				{
					"<leader>sD",
					function()
						Snacks.picker.diagnostics_buffer()
					end,
					desc = "Buffer Diagnostics",
				},
				{
					"<leader>sh",
					function()
						Snacks.picker.help()
					end,
					desc = "Help Pages",
				},
				{
					"<leader>sH",
					function()
						Snacks.picker.highlights()
					end,
					desc = "Highlights",
				},
				{
					"<leader>si",
					function()
						Snacks.picker.icons()
					end,
					desc = "Icons",
				},
				{
					"<leader>sj",
					function()
						Snacks.picker.jumps()
					end,
					desc = "Jumps",
				},
				{
					"<leader>sk",
					function()
						Snacks.picker.keymaps()
					end,
					desc = "Keymaps",
				},
				{
					"<leader>sl",
					function()
						Snacks.picker.loclist()
					end,
					desc = "Location List",
				},
				{
					"<leader>sm",
					function()
						Snacks.picker.marks()
					end,
					desc = "Marks",
				},
				{
					"<leader>sM",
					function()
						Snacks.picker.man()
					end,
					desc = "Man Pages",
				},
				{
					"<leader>sp",
					function()
						Snacks.picker.lazy()
					end,
					desc = "Search for Plugin Spec",
				},
				{
					"<leader>sq",
					function()
						Snacks.picker.qflist()
					end,
					desc = "Quickfix List",
				},
				{
					"<leader>sR",
					function()
						Snacks.picker.resume()
					end,
					desc = "Resume",
				},
				{
					"<leader>su",
					function()
						Snacks.picker.undo()
					end,
					desc = "Undo History",
				},
				{
					"<leader>uC",
					function()
						Snacks.picker.colorschemes()
					end,
					desc = "Colorschemes",
				},
				-- LSP
				{
					"<leader>gd",
					function()
						Snacks.picker.lsp_definitions()
					end,
					desc = "Goto Definition",
				},
				{
					"<leader>gD",
					function()
						Snacks.picker.lsp_declarations()
					end,
					desc = "Goto Declaration",
				},
				{
					"<leader>gr",
					function()
						Snacks.picker.lsp_references()
					end,
					nowait = true,
					desc = "References",
				},
				-- {
				-- 	"gI",
				-- 	function()
				-- 		Snacks.picker.lsp_implementations()
				-- 	end,
				-- 	desc = "Goto Implementation",
				-- },
				-- {
				-- 	"gy",
				-- 	function()
				-- 		Snacks.picker.lsp_type_definitions()
				-- 	end,
				-- 	desc = "Goto T[y]pe Definition",
				-- },
				-- {
				-- 	"gai",
				-- 	function()
				-- 		Snacks.picker.lsp_incoming_calls()
				-- 	end,
				-- 	desc = "C[a]lls Incoming",
				-- },
				-- {
				-- 	"gao",
				-- 	function()
				-- 		Snacks.picker.lsp_outgoing_calls()
				-- 	end,
				-- 	desc = "C[a]lls Outgoing",
				-- },
				-- {
				-- 	"<leader>ss",
				-- 	function()
				-- 		Snacks.picker.lsp_symbols()
				-- 	end,
				-- 	desc = "LSP Symbols",
				-- },
				-- {
				-- 	"<leader>ws",
				-- 	function()
				-- 		Snacks.picker.lsp_workspace_symbols()
				-- 	end,
				-- 	desc = "LSP Workspace Symbols",
				-- },
				-- Other
				{
					"<leader>z",
					function()
						Snacks.zen()
					end,
					desc = "Toggle Zen Mode",
				},
				{
					"<leader>Z",
					function()
						Snacks.zen.zoom()
					end,
					desc = "Toggle Zoom",
				},
				{
					"<leader>.",
					function()
						Snacks.scratch()
					end,
					desc = "Toggle Scratch Buffer",
				},
				{
					"<leader>S",
					function()
						Snacks.scratch.select()
					end,
					desc = "Select Scratch Buffer",
				},
				{
					"<leader>n",
					function()
						Snacks.notifier.show_history()
					end,
					desc = "Notification History",
				},
				{
					"<leader>bd",
					function()
						Snacks.bufdelete()
					end,
					desc = "Delete Buffer",
				},
				{
					"<leader>cR",
					function()
						Snacks.rename.rename_file()
					end,
					desc = "Rename File",
				},
				{
					"<leader>gB",
					function()
						Snacks.gitbrowse()
					end,
					desc = "Git Browse",
					mode = { "n", "v" },
				},
				{
					"<leader>gg",
					function()
						Snacks.lazygit()
					end,
					desc = "Lazygit",
				},
				{
					"<leader>un",
					function()
						Snacks.notifier.hide()
					end,
					desc = "Dismiss All Notifications",
				},
				{
					"]]",
					function()
						Snacks.words.jump(vim.v.count1)
					end,
					desc = "Next Reference",
					mode = { "n", "t" },
				},
				{
					"[[",
					function()
						Snacks.words.jump(-vim.v.count1)
					end,
					desc = "Prev Reference",
					mode = { "n", "t" },
				},
			},
			init = function()
				vim.api.nvim_create_autocmd("User", {
					pattern = "VeryLazy",
					callback = function()
						-- Setup some globals for debugging (lazy-loaded)
						_G.dd = function(...)
							Snacks.debug.inspect(...)
						end
						_G.bt = function()
							Snacks.debug.backtrace()
						end

						-- Override print to use snacks for `:=` command
						if vim.fn.has("nvim-0.11") == 1 then
							vim._print = function(_, ...)
								dd(...)
							end
						else
							vim.print = _G.dd
						end

						-- Create some toggle mappings
						Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
						Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
						Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
						Snacks.toggle.diagnostics():map("<leader>ud")
						Snacks.toggle.line_number():map("<leader>ul")
						Snacks.toggle
							.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
							:map("<leader>uc")
						Snacks.toggle.treesitter():map("<leader>uT")
						Snacks.toggle
							.option("background", { off = "light", on = "dark", name = "Dark Background" })
							:map("<leader>ub")
						Snacks.toggle.inlay_hints():map("<leader>uh")
						Snacks.toggle.indent():map("<leader>ug")
						Snacks.toggle.dim():map("<leader>uD")
					end,
				})
			end,
		},

		--Treesitter
		{
			"nvim-treesitter/nvim-treesitter",
			lazy = false,
			build = ":TSUpdate",
			config = function()
				require("nvim-treesitter").install({
					"c",
					"lua",
					"cpp",
					"java",
					"python",
					"markdown",
				})
				vim.api.nvim_create_autocmd("FileType", {
					pattern = {
						"c",
						"cpp",
						"lua",
						"java",
						"md",
						"py",
					},
					callback = function()
						vim.treesitter.start()
						vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
						vim.wo[0][0].foldmethod = "expr"
						vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end,
				})
			end,
		},

		-- Lsp-config
		{
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

				vim.lsp.enable({
					"lua_ls",
					"clangd",
					"marksman",
					"pylsp",
				})
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
				vim.keymap.set("n", "<leader>grn", vim.lsp.buf.rename, { desc = "Global Rename" })
			end,
		},

		-- Auto-Completions
		{
			"hrsh7th/nvim-cmp",
			dependencies = {
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-cmdline",
				"L3MON4D3/LuaSnip",
				"saadparwaiz1/cmp_luasnip",
				"rafamadriz/friendly-snippets",
			},
			config = function()
				require("luasnip.loaders.from_vscode").load({})
				local cmp = require("cmp")
				cmp.setup({
					snippet = {
						-- REQUIRED - you must specify a snippet engine
						expand = function(args)
							require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
						end,
					},
					window = {
						completion = cmp.config.window.bordered(),
						documentation = cmp.config.window.bordered(),
					},
					mapping = cmp.mapping.preset.insert({
						["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					}),
					sources = cmp.config.sources({
						{ name = "nvim_lsp" },
						{ name = "luasnip" }, -- For luasnip users.
					}, {
						{ name = "buffer" },
					}),
				})
			end,
		},

		-- Auto-Brackets
		{
			"altermo/ultimate-autopair.nvim",
			event = { "InsertEnter", "CmdlineEnter" },
			branch = "v0.6", --recommended as each new version will have breaking changes
			opts = {
				--Config goes here
			},
		},

		-- Formatting
		{
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
		},

		-- Liniting

		{
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
		},

		--markdown
		{
			"MeanderingProgrammer/render-markdown.nvim",
			dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
			---@module 'render-markdown'
			---@type render.md.UserConfig
			opts = {},
			config = function()
				require("render-markdown").setup({
					render_modes = { "n", "c", "t" },
					completions = { lsp = { enabled = true } },
				})
			end,
		},
		{
			"iamcco/markdown-preview.nvim",
			cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
			build = "cd app && yarn install",
			init = function()
				vim.g.mkdp_filetypes = { "markdown" }
			end,
			ft = { "markdown" },
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

		--yazi
		{
			"mikavilpas/yazi.nvim",
			version = "*", -- use the latest stable version
			event = "VeryLazy",
			dependencies = {
				{ "nvim-lua/plenary.nvim", lazy = true },
			},
			keys = {
				-- 👇 in this section, choose your own keymappings!
				-- {
				-- 	"<leader>-",
				-- 	mode = { "n", "v" },
				-- 	"<cmd>Yazi<cr>",
				-- 	desc = "Open yazi at the current file",
				-- },
				{
					-- Open in the current working directory
					"<leader>e",
					"<cmd>Yazi cwd<cr>",
					desc = "Open the file manager in nvim's working directory",
				},
				-- {
				-- 	"<c-up>",
				-- 	"<cmd>Yazi toggle<cr>",
				-- 	desc = "Resume the last yazi session",
				-- },
			},
			---@type YaziConfig | {}
			opts = {
				-- if you want to open yazi instead of netrw, see below for more info
				open_for_directories = false,
				keymaps = {
					show_help = "<f1>",
				},
			},
			-- 👇 if you use `open_for_directories=true`, this is recommended
			init = function()
				-- mark netrw as loaded so it's not loaded at all.
				--
				-- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
				vim.g.loaded_netrwPlugin = 1
			end,
		},
	},
	install = { colorscheme = { "catppuccin-mocha" } },
	checker = { enabled = true },
})
