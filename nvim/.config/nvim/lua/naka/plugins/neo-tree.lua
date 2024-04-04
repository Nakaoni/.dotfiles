return {
    "nvim-neo-tree/neo-tree.nvim",
    version = "^3",
    dependencies = {
        {
            "MunifTanjim/nui.nvim",
            version = "^v0.3",
        }
    },
    keys = {
        { "<leader>m", "<cmd>Neotree toggle<CR>", desc ="Open/Close NeoTree" }
    },
    opts = {
        window = {
            mappings = {
                ["o"] = "open",
                ["<BS>"] = "close_node",
            },
        },
        filesystem = {
            filtered_items = {
                visible = true,
            },
            follow_current_file = {
                enabled = true,
            },
        },
    },
}
