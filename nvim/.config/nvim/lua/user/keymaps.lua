local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

-- Remap comma as leader keymap
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Modes:
-- Normal mode = "n"
-- Insert mode = "i"
-- Visual mode = "v"
-- Visual block mode = "x"
-- Terminal mode = "t"
-- Command mode = "c"

-- Normal mode

-- Window split creation
keymap("n", "<leader>h", ":split<CR>", opts)
keymap("n", "<leader>v", ":vsplit<CR>", opts)

-- Window navigation
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Window resize
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Hide highlight search until next search
keymap("n", "<leader>/", ":noh<CR>", opts)

-- Telescope mapping
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep_args<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts)

keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>", opts)

-- Nvimtree
keymap("n", "<leader>m", ":NvimTreeToggle<CR>", opts)

-- vim-bbye
keymap("n", "<leader>q", ":Bdelete<CR>", opts)

-- phpactor
keymap("n", "<leader>ph", ":PhpactorContextMenu<CR>", opts)

-- Format
keymap("n", "<leader>f", ":lua vim.lsp.buf.formatting_sync()<CR>", opts)

-- Gitsigns mapping
keymap("n", "<leader>gd", ":Gitsigns diffthis<CR>", opts)
keymap("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", opts)
keymap("n", "<leader>gp", ":Gitsigns prev_hunk<CR>", opts)
keymap("n", "<leader>gn", ":Gitsigns next_hunk<CR>", opts)

-- Dap mapping
keymap("n", "<leader>db", ":DapToggleBreakpoint<CR>", opts)
keymap("n", "<leader>dc", ":DapContine<CR>", opts)
keymap("n", "<leader>dt", ":DapTerminate<CR>", opts)
keymap("n", "<leader>do", ":lua require('dapui').toggle()<CR>", opts)
keymap("n", "<leader>dsi", ":DapStepInto<CR>", opts)
keymap("n", "<leader>dso", ":DapStepOver<CR>", opts)
keymap("n", "<leader>dsu", ":DapStepOut<CR>", opts)

-- Visual mode

keymap("v", "<A-j>", ":m .+1<CR>", opts)
keymap("v", "<A-k>", ":m .-2<CR>", opts)

-- Terminal mode

-- ToggleTerm
keymap("n", "<C-_>", ":ToggleTerm<CR>", opts)

keymap("t", "<Esc>", [[ <C-\><C-n> ]], opts)
-- keymap("t", "<C-h>", [[ <C-\><C-n><C-W>h ]], opts)
-- keymap("t", "<C-j>", [[ <C-\><C-n><C-W>j ]], opts)
-- keymap("t", "<C-k>", [[ <C-\><C-n><C-W>k ]], opts)
-- keymap("t", "<C-l>", [[ <C-\><C-n><C-W>l ]], opts)
