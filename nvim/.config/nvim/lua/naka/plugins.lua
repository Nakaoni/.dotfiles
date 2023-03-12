local fn = vim.fn

-- Auto install packer.nvim when cloned
local install_base_path = fn.stdpath("data") .. "/site/pack/packer/start"
local install_path = install_base_path .. "/packer.nvim"

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

local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

return packer.startup(function(use)
    -- Package Manager
    use("wbthomason/packer.nvim")

    -- Colorscheme
    use({
        "rose-pine/neovim",
        as = "rose-pine",
        tag = "v1.*",
    })

    -- Tree-sitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })

    -- Comments
    use({
        "numToStr/Comment.nvim",
    })

    -- Status line
    use({
        "nvim-lualine/lualine.nvim",
    })
    use({
        "arkav/lualine-lsp-progress",
    })

    -- File explorer
    use({ "nvim-tree/nvim-web-devicons" })
    use({ "nvim-tree/nvim-tree.lua" })

    -- LSP / Completion
    use({ "neovim/nvim-lspconfig" })
    use({ "hrsh7th/cmp-nvim-lsp" })
    use({ "hrsh7th/cmp-buffer" })
    use({ "hrsh7th/cmp-path" })
    use({ "hrsh7th/cmp-cmdline" })
    use({ "hrsh7th/nvim-cmp" })

    use({ "williamboman/mason.nvim" })
    use({ "williamboman/mason-lspconfig.nvim" })

    -- Snippets
    use({ "L3MON4D3/LuaSnip", requires = {
        "rafamadriz/friendly-snippets",
    } })
    use({ "saadparwaiz1/cmp_luasnip" })

    -- Fuzzy finder
    use({
        "nvim-telescope/telescope.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" },
            {
                "BurntSushi/ripgrep",
                run = "cargo build --release",
            },
            { "sharkdp/fd" },
        },
    })

    -- Autopairs
    use({ "windwp/nvim-autopairs" })

    -- Tabs
    use({ "akinsho/bufferline.nvim" })
    use({ "moll/vim-bbye" })
    use({ "lukas-reineke/indent-blankline.nvim" })

    -- DAP
    use({ "mfussenegger/nvim-dap" })
    use({ "rcarriga/nvim-dap-ui" })

    -- Linter / Formatter
    use({ "jose-elias-alvarez/null-ls.nvim" })

    use({ "phpactor/phpactor", run = "composer install --no-dev -o" })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        packer.sync()
    end
end)
