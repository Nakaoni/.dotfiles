local lspconfig = require("lspconfig")

local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

vim.diagnostic.config({ signs = { active = signs } })

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<C-p>", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "<C-n>", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "gq", vim.diagnostic.setloclist, opts)

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

local servers = {
    sumneko_lua = {
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
    },
    tsserver = {
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
    },
    phpactor = {
        on_attach = on_attach,
        filetypes = { "php", "cucumber" },
    },
    emmet_ls = {
        on_attach = on_attach,
        filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "twig" },
    },
    gopls = {
        on_attach = on_attach,
        settings = {
            gopls = {
                gofumpt = true,
            },
        },
    },
    tailwindcss = {
        on_attach = on_attach,
    },
    rust_analyzer = {
        on_attach = on_attach,
    },
}

for server, config in pairs(servers) do
    lspconfig[server].setup(config)
end
