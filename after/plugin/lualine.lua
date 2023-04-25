local branch = {
    "branch",
    icons_enabled = true,
    icon = "",
}

require("lualine").setup({
    options = {
        theme = "nightfly",
        component_separators = "",
        section_separators = "",
        disabled_filetypes = { "dashboard", "Outline" },
        always_divide_middle = true,
    },
    sections = {
        lualine_a = { branch },
        lualine_b = { { "filename", path = 1, symbols = { unnamed = "" } }, "diff", "diagnostics" },
        lualine_c = { "lsp_progress" },
        lualine_x = {},
        lualine_y = { { "location", padding = 1 } },
        lualine_z = { "progress" }
    },
})
