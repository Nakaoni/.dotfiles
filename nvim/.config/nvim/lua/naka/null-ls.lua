local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

-- Auto format on save
local on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
            end,
        })
    end
end

null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.phpstan,
        null_ls.builtins.diagnostics.phpcs.with({
            extra_args = { "--standard=PSR12" },
        }),
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.rome,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.phpcbf.with({
            extra_args = { "--standard=PSR12" },
        }),
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.rustfmt,
    },
    on_attach = on_attach,
})
