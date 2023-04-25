local neo_tree = require("neo-tree")

neo_tree.setup({
    window = {
        width = 50,
        mappings = {
            ["o"] = "open",
        },
    },
    filesystem = {
        filtered_items = {
            visible = true,
        }
    }
})
