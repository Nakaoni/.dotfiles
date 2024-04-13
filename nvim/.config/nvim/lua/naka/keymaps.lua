-- remap leader keymap
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Window split creation
vim.keymap.set("n", "<leader>h", ":split<CR>", { desc = "Split the window [H]orizontally" })
vim.keymap.set("n", "<leader>v", ":vsplit<CR>", { desc = "Spit the window [V]erticaly" })

-- Window navigation
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move cursor the TOP window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move cursor the BOTTOM window" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move cursor the RIGHT window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move cursor the LEFT window" })

-- Window resize
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", { desc = "Reduce the window horizontally" })
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", { desc = "Reduce the window horizontally" })
vim.keymap.set("n", "<C-left>", ":vertical resize -2<CR>", { desc = "Reduce the window verticaly" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Grow the window verticaly" })

-- Hide highlight search
vim.keymap.set("n", "<Esc>", ":noh<CR>", { desc = "Hide highlight search" })

-- Switch buffer
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Switch to previous buffer" })
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Switch to next buffer" })

-- Close buffer
vim.keymap.set("n", "<leader>q", ":bdelete<CR>", { desc = "Close current buffer" })
vim.keymap.set("n", "<leader>Q", ":bdelete!<CR>", { desc = "Close current buffer without saving" })

-- Move text
-- vim.keymap.set("n", "<A-j>", "<Esc>:m .+1<CR>", { desc = "Move text up" })
-- vim.keymap.set("n", "<A-k>", "<Esc>:m .-2<CR>", { desc = "Move text down" })
--
-- vim.keymap.set("v", "<A-j>", ":m .+1<CR>", { desc = "Move selection up" })
-- vim.keymap.set("v", "<A-k>", ":m .-2<CR>", { desc = "Move selection down" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>E", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
