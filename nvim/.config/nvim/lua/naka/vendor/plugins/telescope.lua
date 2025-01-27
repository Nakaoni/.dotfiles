return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            {
                "nvim-lua/plenary.nvim",
            },
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
        },
        config = function()
            local telescope = require("telescope")
            telescope.setup({
                extensions = {
                    fzf = {},
                },
            })

            telescope.load_extension("fzf")

            local builtin = require("telescope.builtin")

            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope: [f]ind [f]iles" })
            vim.keymap.set("n", "<leader>en", function()
                builtin.find_files({
                    cwd = vim.fn.stdpath("config")
                })
            end, { desc = "Telescope: [E]dit [N]eovim" })
            vim.keymap.set("n", "<leader>ez", function()
                builtin.find_files({
                    cwd = "$HOME/.config/zsh"
                })
            end, { desc = "Telescope: [E]dit [Z]sh" })
        end
    }
}
