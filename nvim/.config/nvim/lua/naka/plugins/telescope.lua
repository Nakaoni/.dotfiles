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
}
