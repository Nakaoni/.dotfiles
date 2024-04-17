return {
    {
        "nvim-lua/plenary.nvim",
        commit = "8aad4396840be7fc42896e3011751b7609ca4119",
        lazy = false,
        priority = 999,
    },

    -- Autopairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        commit = "dbfc1c34bed415906395db8303c71039b3a3ffb4",
        opts = {},
    },

    -- icons
    {
        "nvim-tree/nvim-web-devicons",
        commit = "3ee60deaa539360518eaab93a6c701fe9f4d82ef",
        lazy = false,
        priority = 998,
        opts = {},
        enabled = vim.g.have_nerd_font,
    },

    -- auto tab vs space
    {
        "tpope/vim-sleuth",
        commit = "1cc4557420f215d02c4d2645a748a816c220e99b",
    },
}
