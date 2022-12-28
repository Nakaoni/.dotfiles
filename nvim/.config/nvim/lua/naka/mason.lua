local lspconfig = require("lspconfig")

require("mason").setup({
    ensure_installed = {
        "sumneko_lua",
        "rust_analyzer",
        "phpactor",
        "emmet_ls",
    },
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup()

local on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "grn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "gca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "gf", function()
        vim.lsp.buf.format({ async = true })
    end, bufopts)
end

mason_lspconfig.setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({
            on_attach = on_attach,
        })
    end,
    ["sumneko_lua"] = function()
        lspconfig.sumneko_lua.setup({
            on_attach = on_attach,
            settings = {
                Lua = {
                    format = {
                        enable = true,
                    },
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                },
            },
        })
    end,
    ["tsserver"] = function()
        lspconfig.tsserver.setup({
            on_attach = on_attach,
            settings = {
                typescript = {
                    format = {
                        indentSize = 2,
                    },
                },
                javascript = {
                    format = {
                        indentSize = 2,
                    },
                },
            },
        })
    end,
    ["phpactor"] = function()
        lspconfig.phpactor.setup({
            on_attach = on_attach,
            filetypes = { "php", "cucumber" },
        })
    end,
    ["emmet_ls"] = function()
        lspconfig.emmet_ls.setup({
            on_attach = on_attach,
            filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "twig" },
        })
    end,
    ["gopls"] = function()
        lspconfig.gopls.setup({
            on_attach = on_attach,
            settings = {
                gopls = {
                    gofumpt = true,
                },
            },
        })
    end,
})
