return {
    {
        'stevearc/oil.nvim',
        config = function()
            require("oil").setup({
                columns = {
                    "icon",
                },
                view_options = {
                    show_hidden = true,
                },
            })
            vim.keymap.set("n", "<leader>m", "<CMD>Oil<CR>", { desc = "Open Oil [M]enu" })
        end
    }
}
