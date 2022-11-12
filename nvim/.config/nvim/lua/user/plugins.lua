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

    use { "williamboman/mason.nvim" }

    -- completion plugin
    use({
        "hrsh7th/nvim-cmp",
    })
    use({
        "hrsh7th/cmp-buffer",
    }) -- buffer completions
    use({
        "hrsh7th/cmp-path",
    }) -- path completions
    use({
        "hrsh7th/cmp-cmdline",
    }) -- command line completions
    use({
        "hrsh7th/cmp-nvim-lsp",
    })
    use({
        "hrsh7th/cmp-nvim-lua",
    })
    use({
        "saadparwaiz1/cmp_luasnip",
    })

    -- Snippets
    use({
        "L3MON4D3/LuaSnip",
        tag = "v1.*"
    })
    use({
        "rafamadriz/friendly-snippets",
    })

    -- Treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })

    -- Fuzzy finder
    use({
        "nvim-telescope/telescope.nvim",
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
    })
    use({
        "arkav/lualine-lsp-progress",
    })

    -- LSP
    use({
        "neovim/nvim-lspconfig",
    })
    use({
        "williamboman/nvim-lsp-installer",
    })

    -- Autopairs
    use({
        "windwp/nvim-autopairs",
    })

    -- Comments
    use({
        "numToStr/Comment.nvim",
    })

    -- Git
    use({
        "lewis6991/gitsigns.nvim",
        commit = "c18e016864c92ecf9775abea1baaa161c28082c3",
    })

    -- nvim-tree
    use({
        "kyazdani42/nvim-web-devicons",
    })
    use({
        "kyazdani42/nvim-tree.lua",
    })

    -- Bufferline
    use({
        "akinsho/bufferline.nvim",
    })
    use({
        "moll/vim-bbye",
    })

    -- Indentline
    use({
        "lukas-reineke/indent-blankline.nvim",
        tag = "v2.*",
    })

    -- DAP
    use({
        "mfussenegger/nvim-dap",
    })
    use({
        "rcarriga/nvim-dap-ui",
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
