return {
    "hrsh7th/nvim-cmp",
    commit = "ce16de5665c766f39c271705b17fff06f7bcb84f",
    event = "InsertEnter",
    dependencies = {
        {
            "hrsh7th/cmp-nvim-lsp",
            commit = "5af77f54de1b16c34b23cba810150689a3a90312",
        },
        {
            "L3MON4D3/LuaSnip",
            version = "^v2",
            build = "make install_jsregexp",
            cond = function()
                return vim.fn.executable("make") == 1
            end,
        },
        {
            "saadparwaiz1/cmp_luasnip",
            commit = "05a9ab28b53f71d1aece421ef32fee2cb857a843",
        },
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        luasnip.config.setup()

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            -- completion = { completeopt = "menu,menuone,noinsert"},
            mapping = cmp.mapping.preset.insert({
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete({}),
                ["<C-l>"] = cmp.mapping(function()
                    if luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    end
                end, { "i", "s" }),
                ["<C-h>"] = cmp.mapping(function()
                    if luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    end
                end, { "i", "s" }),
            }),
            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
            },
        })
    end,
}
