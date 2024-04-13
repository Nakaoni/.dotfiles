return {
    "echasnovski/mini.nvim",
    tag = "v0.12.0",
    config = function()
        require("mini.ai").setup()
        require("mini.animate").setup()
        require("mini.surround").setup()
        require("mini.statusline").setup({
            use_icons = vim.g.have_nerd_font,
        })
        require("mini.comment").setup()
        require("mini.animate").setup()
        require("mini.move").setup()
        require("mini.splitjoin").setup()
    end,
}
