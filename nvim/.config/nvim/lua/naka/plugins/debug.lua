return {
    "mfussenegger/nvim-dap",
    commit = "405df1dcc2e395ab5173a9c3d00e03942c023074",
    dependencies = {
        {
            "rcarriga/nvim-dap-ui",
            version = "^v4",
        },
        {
            "nvim-neotest/nvim-nio",
            version = "^v1",
        },
        {
            "jay-babu/mason-nvim-dap.nvim",
            version = "^v2",
        },
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        require("mason-nvim-dap").setup({
            automatic_setup = true,
            automatic_installation = false,
            ensure_installed = {},
        })

        vim.keymap.set("n", "<leader>1", dap.step_over, { desc = "Debug: Step over" })
        vim.keymap.set("n", "<leader>2", dap.step_into, { desc = "Debug: Step Into" })
        vim.keymap.set("n", "<leader>3", dap.step_out, { desc = "Debug: Step out" })
        vim.keymap.set("n", "<leader>4", dap.step_back, { desc = "Debug: Step back" })
        vim.keymap.set("n", "<leader>5", dap.continue, { desc = "Debug: Start/Continue" })
        vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Set Breakpoint" })
        -- TODO: set Breakpoint condition -> see how does it work ?
        vim.keymap.set("n", "<leader>0", dapui.toggle, { desc = "Debug: See session result" })

        require("neodev").setup({
            library = { plugins = { "nvim-dap-ui" }, types = true },
        })
        dap.listeners.after.event_initialized.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        require("naka.after.plugin.dap")
    end,
}
