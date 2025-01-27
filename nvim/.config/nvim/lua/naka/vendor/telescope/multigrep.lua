local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local make_enty = require("telescope.make_entry")
local config = require("telescope.config").values

local M = {}

local live_multigrep = function(opts)
    opts = opts or {}
    opts.cwd = opts.cwd or vim.uv.cwd()

    local finder = finders.new_async_job({
        command_generator = function(prompt)
            if not prompt or prompt == "" then
                return nil
            end

            local split = vim.split(prompt, " | ")
            local args = { "rg" }
            if split[1] then
                table.insert(args, "-e")
                table.insert(args, split[1])
            end

            if split[2] then
                table.insert(args, "-g")
                table.insert(args, split[2])
            end

            return vim.tbl_flatten({
                args,
                {
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case"
                }
            })
        end,
        entry_maker = make_enty.gen_from_vimgrep(opts),
        cmd = opts.cwd,
    })

    vim.inspect(finder)

    pickers.new(opts, {
        debounce = 100,
        prompt_title = "Multi Grep",
        finder = finder,
        previewer = config.grep_previewer(opts),
        sorter = require("telescope.sorters").empty(),
    }):find()
end

M.setup = function()
    vim.keymap.set("n", "<leader>fm", live_multigrep, { desc = "[F]ind [M]ultigrep" })
end

return M
