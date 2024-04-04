return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        priority = 1000,
        version = "^v3",
        opts = {
            dim_inactive_windows = true,
        },
        config = function()
            vim.cmd("colorscheme rose-pine-moon")
        end
    }
}
