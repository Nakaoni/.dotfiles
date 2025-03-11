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
                pickers = {
                    find_files = {
                        theme = "ivy",
                    },
                    live_grep = {
                        theme = "ivy",
                    },
                },
                extensions = {
                    fzf = {},
                },
            })

            telescope.load_extension("fzf")

            local builtin = require("telescope.builtin")

            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope: [f]ind [f]iles" })
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope: [f]ind with [G]rep" })

            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope: [f]ind [b]uffers" })

            vim.keymap.set("n", "<leader>ec", function()
                builtin.find_files({
                    cwd = "$HOME/.dotfiles/",
                    hidden = true,
                })
            end, { desc = "Telescope: [E]dit [C]onfig" })

            vim.keymap.set("n", "<leader>fa", function()
                builtin.find_files({
                    hidden = true,
                    no_ignore = true,
                })
            end, { desc = "Telescope: [F]ind [A]ll" })

            vim.keymap.set("n", "<leader>fp", function()
                builtin.find_files({
                    cwd = vim.fs.joinpath(vim.fn.stdpath("config"), "lazy")
                })
            end, { desc = "Telescope: [E]dit [N]eovim" })

            vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Telescope: [F]ind [K]eymaps" })

            -- Special keymap
            require("naka.vendor.telescope.multigrep").setup()
        end
    }
}
