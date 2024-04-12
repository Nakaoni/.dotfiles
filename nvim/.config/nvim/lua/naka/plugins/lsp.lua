return {
    "neovim/nvim-lspconfig",
    commit = "9619e53d3f99f0ca4ea3b88f5d97fce703131820",
    dependencies = {
        {
            "williamboman/mason.nvim",
            version = "^v1",
            opts = {},
        },
        {
            "williamboman/mason-lspconfig.nvim",
            version = "^v1",
        },
        {
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            commit = "b129892f783740e6cf741f2ea09fa5dd512aa584",
        },
        {
            "folke/neodev.nvim",
            version = "^v2",
            opts = {},
        },
        {
            "j-hui/fidget.nvim",
            version = "^v1",
            opts = {},
        },
    },
    config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("config-lsp-attach", { clear = true }),
            callback = function(event)
                local builtin = require("telescope.builtin")
                vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "LSP: [G]oto [D]efinition" })
                vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "LSP: [G]oto [R]eferences" })
                vim.keymap.set("n", "gI", builtin.lsp_implementations, { desc = "LSP: [G]oto [I]mplementations" })
                vim.keymap.set("n", "<leader>D", builtin.lsp_type_definitions, { desc = "LSP: [T]ype [D]efinition" })
                vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, { desc = "LSP: [D]ocument [S]ymbols" })
                vim.keymap.set(
                    "n",
                    "<leader>ws",
                    builtin.lsp_dynamic_workspace_symbols,
                    { desc = "LSP: [W]orkspace [S]ymbols" }
                )
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP: [R]e[n]ame" })
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: [C]ode [A]ction" })
                vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP: Hover Documentation" })
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "LSP: [G]oto [D]eclaration" })
            end,
        })

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

        local servers = {
            lua_ls = {
                completion = {
                    callSnippet = "Replace",
                },
            },
        }

        local ensure_installed = vim.tbl_keys(servers)
        ensure_installed = vim.list_extend(ensure_installed, {
            "stylua",
        })

        local mason_tool_installer = require("mason-tool-installer")
        mason_tool_installer.setup({
            ensure_installed = ensure_installed,
        })

        local mason_lspconfig = require("mason-lspconfig")
        mason_lspconfig.setup({
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilites or {})
                    local lspconfig = require("lspconfig")
                    lspconfig[server_name].setup(server)
                end,
            },
        })
    end,
}
