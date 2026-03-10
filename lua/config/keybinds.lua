-- Leader Key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Saving File
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Write File" })
vim.keymap.set("n", "<leader>q", ":qw<CR>", { desc = "Write and Quit File" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit File" })

-- Splits
vim.keymap.set("n", "<leader>dv", ":vsplit<CR>", { desc = "Split vertically" })
vim.keymap.set("n", "<leader>dh", ":split<CR>", { desc = "Split Horizontally" })

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

-- terminal
vim.keymap.set("n", "<leader>tt", "<cmd>FloatermToggle<CR>", { silent = true })

--file explorer
vim.keymap.set("n", "<space>e", ":Telescope file_browser<CR>")
