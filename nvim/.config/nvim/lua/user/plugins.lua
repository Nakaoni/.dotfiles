local fn = vim.fn

-- Auto install packer.nvim when cloned
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don"t error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Install plugins
return require("packer").startup(function(use)
    -- Package Manager
    use("wbthomason/packer.nvim")

    -- completion plugin
    use({
        "hrsh7th/nvim-cmp",
        commit = "15c7bf7c0dfb7c75eb526c53f9574633c13dc22d",
    })
    use({
        "hrsh7th/cmp-buffer",
        commit = "12463cfcd9b14052f9effccbf1d84caa7a2d57f0",
    }) -- buffer completions
    use({
        "hrsh7th/cmp-path",
        commit = "466b6b8270f7ba89abd59f402c73f63c7331ff6e",
    }) -- path completions
    use({
        "hrsh7th/cmp-cmdline",
        commit = "c36ca4bc1dedb12b4ba6546b96c43896fd6e7252",
    }) -- command line completions
    use({
        "hrsh7th/cmp-nvim-lsp",
        commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8",
    })
    use({
        "hrsh7th/cmp-nvim-lua",
        commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21",
    })
    use({
        "saadparwaiz1/cmp_luasnip",
        commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36",
    })

    -- Snippets
    use({
        "L3MON4D3/LuaSnip",
        commit = "52f4aed58db32a3a03211d31d2b12c0495c45580",
    })
    use({
        "rafamadriz/friendly-snippets",
        commit = "d27a83a363e61009278b6598703a763ce9c8e617",
    })

    -- Treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })

    -- Fuzzy finder
    use({
        "nvim-telescope/telescope.nvim",
        commit = "e2a77a54a35642dd95310effe2bf4e36fff3af26",
        requires = { { "nvim-lua/plenary.nvim", "BurntSushi/ripgrep", "sharkdp/fd",
            "nvim-telescope/telescope-live-grep-args.nvim" } },
    })

    -- Colorscheme
    use({
        "rose-pine/neovim",
        as = "rose-pine",
        tag = "v1.*",
    })

    -- Status line
    use({
        "nvim-lualine/lualine.nvim",
        commit = "3362b28f917acc37538b1047f187ff1b5645ecdd",
    })
    use({
        "arkav/lualine-lsp-progress",
        commit = "56842d097245a08d77912edf5f2a69ba29f275d7",
    })

    -- LSP
    use({
        "neovim/nvim-lspconfig",
        tag = "v0.*",
    })
    use({
        "williamboman/nvim-lsp-installer",
        commit = "4636219c9165739e40c46cf3d44c350ee7bebb15",
    })
    use({
        "jose-elias-alvarez/null-ls.nvim",
        commit = "dfdd5fab3c53c30f83c78ea351b9a8f65715a5b7",
    }) -- For formatters and linters

    -- Autopairs
    use({
        "windwp/nvim-autopairs",
        commit = "84cde3547e9a8b16db0bfe523e98e19b7be5148b",
    })

    -- Comments
    use({
        "numToStr/Comment.nvim",
        commit = "3c69bab36569d5d0321351ec956fc43a8d409fb0",
    })

    -- Git
    use({
        "lewis6991/gitsigns.nvim",
        commit = "c18e016864c92ecf9775abea1baaa161c28082c3",
    })

    -- nvim-tree
    use({
        "kyazdani42/nvim-web-devicons",
        commit = "8d2c5337f0a2d0a17de8e751876eeb192b32310e",
    })
    use({
        "kyazdani42/nvim-tree.lua",
        commit = "bdb6d4a25410da35bbf7ce0dbdaa8d60432bc243",
    })

    -- Bufferline
    use({
        "akinsho/bufferline.nvim",
        tag = "v2.*",
    })
    use({
        "moll/vim-bbye",
        commit = "25ef93ac5a87526111f43e5110675032dbcacf56",
    })

    -- Indentline
    use({
        "lukas-reineke/indent-blankline.nvim",
        tag = "v2.*",
    })

    -- Terminal
    use({
        "akinsho/toggleterm.nvim",
        commit = "aaeed9e02167c5e8f00f25156895a6fd95403af8",
    })

    -- DAP
    use({
        "mfussenegger/nvim-dap",
        commit = "3b5e4b77e81451db4c83fb3ee4aeb89711a8b539",
    })
    use({
        "rcarriga/nvim-dap-ui",
        tag = "v1.*",
    })

    use({
        "phpactor/phpactor",
        tag = "0.*",
        run = "composer install"
    })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
