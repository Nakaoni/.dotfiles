local lsp = require("lsp-zero").preset({})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
    lsp.buffer_autoformat()

    local opts = { buffer = bufnr }
    local keymap = vim.keymap.set

    keymap('n', '<leader>grn', vim.lsp.buf.rename, opts)
    keymap('n', '<leader>gca', vim.lsp.buf.code_action, opts)
    keymap('n', '<leader>gf', vim.lsp.buf.format, opts)
end)

require("lspconfig").lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp.setup()
