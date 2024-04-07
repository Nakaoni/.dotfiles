return {
    "nvim-telescope/telescope.nvim",
    version = "^v0.1",
    event = "VimEnter",
    opts = {},
    dependencies = {
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            commit = "9ef21b2e6bb6ebeaf349a0781745549bbb870d27",
            build = "make",
            cond = function()
                return vim.fn.executable 'make' == 1
            end,
        },
        {
            "nvim-telescope/telescope-ui-select.nvim",
            commit = "6e51d7da30bd139a6950adf2a47fda6df9fa06d2",
            opts = {},
        },
    },
    config = function()
        local telescope = require("telescope")
        telescope.setup({
            defaults = {
                layout_strategy = "vertical",
                layout_config = {
                    mirror = true,
                    prompt_position = "top",
                }
            },
            extension = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown(),
                },
            },
        })

        telescope.load_extension("fzf")
        telescope.load_extension("ui-select")

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
        vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eympas" })
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
        vim.keymap.set("n", "<leader>faf", function()
            builtin.find_files({ hidden = true, no_ignore = true, no_ignore_parent = true })
        end, { desc = "[F]ind [A]ll [F]iles" })
        vim.keymap.set("n", "<leader>fb", builtin.builtin, { desc = "[F]ind [T]elescope" })
        vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind [W]ord" })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind with [G]rep" })
        vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
        vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[F]ind [R]esume" })
        vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = "[F]ind Recent Files" })
        vim.keymap.set("n", "<leader>/", function()
        builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = "[/] Fuzzily search in current buffer" })
      vim.keymap.set("n", "<leader>/", function()
        builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = "[/] Fuzzily search in current buffer" })
      vim.keymap.set("n", "<leader>f/", function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = "Live Grep in Open Files",
        }
      end, { desc = "[F]ind [/] in Open Files" })
      vim.keymap.set("n", "<leader>fn", function()
        builtin.find_files { cwd = vim.fn.stdpath "config" }
      end, { desc = "[F]ind [N]eovim files" })
    end
}
