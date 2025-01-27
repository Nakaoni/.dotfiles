return {
    {
        "echasnovski/mini.nvim",
        opts = {},
        config = function()
            require("mini.icons").setup({
                style = "ascii",
            })
            require("mini.indentscope").setup({
                symbol = "|",
            })
            require("mini.git").setup()
            require("mini.diff").setup()
            require("mini.statusline").setup({
                use_icons = false,
            })
            require("mini.trailspace").setup()
        end
    }
}
