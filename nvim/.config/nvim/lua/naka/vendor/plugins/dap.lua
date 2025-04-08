return {
    {
        "mfussenegger/nvim-dap",
        version = "^0.9",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            dapui.setup()
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end

            -- PHP
            dap.adapters.php = {
                type = "executable",
                command = "node",
                args = { os.getenv("HOME") .. "/Programs/install/vscode-php-debug/out/phpDebug.js" },
            }

            dap.configurations.php = {
                {
                    type = "php",
                    request = "launch",
                    name = "Listen for Xdebug",
                    port = 9003,
                }
            }

            vim.keymap.set('n', '<F5>', function() require('dap').continue() end, { desc = "Dap: continue" })
            vim.keymap.set('n', '<F10>', function() require('dap').step_over() end, { desc = "Dap: step over" })
            vim.keymap.set('n', '<F11>', function() require('dap').step_into() end, { desc = "Dap: step into" })
            vim.keymap.set('n', '<F12>', function() require('dap').step_out() end, { desc = "Dap: step out" })
            vim.keymap.set('n', '<Leader>db', function() require('dap').toggle_breakpoint() end,
                { desc = "Dap: toggle breakpoint" })
            vim.keymap.set('n', '<Leader>dB', function() require('dap').set_breakpoint() end,
                { desc = "Dap: set breakpoint" })
            vim.keymap.set('n', '<Leader>dlp',
                function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end,
                { desc = "Dap: set breakpoint + Log" })
            vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end, { desc = "Dap: repl" })
            vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end, { desc = "Dap: run last" })
            vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
                require('dap.ui.widgets').hover()
            end, { desc = "Dap: hover" })
            vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
                require('dap.ui.widgets').preview()
            end, { desc = "Dap: preview" })
            vim.keymap.set('n', '<Leader>df', function()
                local widgets = require('dap.ui.widgets')
                widgets.sidebar(widgets.frames)
            end, { desc = "Dap: frames sidebar" })
            vim.keymap.set('n', '<Leader>ds', function()
                local widgets = require('dap.ui.widgets')
                widgets.sidebar(widgets.scopes)
            end, { desc = "Dap: scopes sidebar" })
        end
    }
}
