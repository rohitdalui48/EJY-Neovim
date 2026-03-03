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
