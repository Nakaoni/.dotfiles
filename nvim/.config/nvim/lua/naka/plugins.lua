local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Colorscheme
    {
        "rose-pine/neovim",
        name = "rose-pine",
        version = "v1.*",
        priority = 1000,
        config = function()
            require("rose-pine").setup({
                dark_variant = "moon",
                disable_italics = true,
            })

            vim.cmd([[colorscheme rose-pine]])
        end,
    },

    -- Fuzzy finder
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "BurntSushi/ripgrep",
                build = "cargo build --release",
            },
            "nvim-telescope/telescope-live-grep-args.nvim",
        },
    },

    -- Tree-sitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },

    -- Autopairs
    { "windwp/nvim-autopairs" },

    -- file tree explorer
    {
        "nvim-neo-tree/neo-tree.nvim",
        version = "2.*",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
    },

    -- Comment
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    },

    -- buffer line
    {
        "akinsho/bufferline.nvim",
        version = "4.*",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },

    {
        "nvim-lualine/lualine.nvim",
        version = "4.*",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },

    "lukas-reineke/indent-blankline.nvim",

    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" }, -- Required
            {
                -- Optional
                "williamboman/mason.nvim",
                build = function()
                    pcall(vim.cmd, "MasonUpdate")
                end,
            },
            { "williamboman/mason-lspconfig.nvim" }, -- Optional

            -- Autocompletion
            "hrsh7th/nvim-cmp",     -- Required
            "hrsh7th/cmp-nvim-lsp", -- Required
            "L3MON4D3/LuaSnip",     -- Required
            "rafamadriz/friendly-snippets",
        }
    },

    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "jose-elias-alvarez/null-ls.nvim",
        },
    },

    -- Debug Adapter Protocol
    { "mfussenegger/nvim-dap" },
    { "rcarriga/nvim-dap-ui" },
})
