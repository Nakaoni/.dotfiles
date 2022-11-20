local dap = require("dap")
require("dapui").setup()

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>db", ":DapToggleBreakpoint<CR>", opts)
keymap("n", "<leader>do", ":lua require('dapui').toggle()<CR>", opts)
keymap("n", "<leader>dc", ":DapContinue<CR>", opts)
keymap("n", "<leader>dsi", ":DapStepInto<CR>", opts)
keymap("n", "<leader>dso", ":DapStepOver<CR>", opts)
keymap("n", "<leader>dsu", ":DapStepOut<CR>", opts)

dap.adapters.php = {
    type = 'executable',
    command = 'php-debug-adapter',
    -- args = { '$HOME/.local/share/nvim/mason/packages/php-debug-adapter/php-debug-adapter' }
}

dap.configurations.php = {
    {
        type = 'php',
        request = 'launch',
        name = 'Listen for Xdebug',
        port = 9000,
        log = '$HOME/.logs/phpDebug.log'
    }
}
