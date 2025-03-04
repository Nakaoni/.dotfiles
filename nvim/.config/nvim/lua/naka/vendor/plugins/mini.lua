return {
    {
        "echasnovski/mini.nvim",
        opts = {},
        config = function()
            require("mini.icons").setup()
            require("mini.indentscope").setup({
                symbol = "|",
            })
            require("mini.git").setup()
            require("mini.diff").setup()
            require("mini.statusline").setup({
                use_icons = true,
            })
            require("mini.trailspace").setup()
        end
    }
}
