return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "folke/lazydev.nvim",
                ft = "lua",
                opts = {
                    library = {
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } }
                    },
                },
            },
            { "saghen/blink.cmp" },
        },
        config = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities()
            local defaultConfig = {
                capatibilies = capabilities
            }
            require("lspconfig").lua_ls.setup(defaultConfig)
            require("lspconfig").phpactor.setup(defaultConfig)
            require("lspconfig").basedpyright.setup(defaultConfig)

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if not client then
                        return
                    end

                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            buffer = args.buf,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                            end
                        })
                    end

                    if client.supports_method("textDocument/rename") then
                        vim.keymap.set("n", "grn", vim.lsp.buf.rename)
                    end

                    if client.supports_method("textDocument/codeAction") then
                        vim.keymap.set("n", "gra", vim.lsp.buf.code_action)
                    end

                    if client.supports_method("textDocument/references") then
                        vim.keymap.set("n", "grr", vim.lsp.buf.references)
                    end

                    if client.supports_method("textDocument/signatureHelp") then
                        vim.keymap.set("n", "grs", vim.lsp.buf.signature_help)
                    end

                    if client.supports_method("textDocument/declaration") then
                        vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
                    end

                    if client.supports_method("textDocument/definition") then
                        vim.keymap.set("n", "gd", vim.lsp.buf.definition)
                    end

                    if client.supports_method("textDocument/implementation") then
                        vim.keymap.set("n", "gri", vim.lsp.buf.implementation)
                    end
                end
            })
        end
    }
}
