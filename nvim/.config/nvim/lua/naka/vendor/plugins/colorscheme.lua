return {
    {
        "sainnhe/gruvbox-material",
        config = function()
            vim.cmd("set background=light")
            vim.g.gruvbox_material_enable_italic = false
            vim.g.gruvbox_material_background = "soft"
            vim.cmd("colorscheme gruvbox-material")
        end
    },
}
