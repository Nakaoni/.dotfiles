local neo_tree = require("neo-tree")

neo_tree.setup({
    window = {
        width = 50,
        mappings = {
            ["o"] = "open",
            ["<BS>"] = "close_node",
        },
    },
    filesystem = {
        filtered_items = {
            visible = true,
        },
        follow_current_file = true,
    },
})
