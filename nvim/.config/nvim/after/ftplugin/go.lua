-- :h options

local options = {
    -- tab behavior
    expandtab = false,
    softtabstop = 0,
    shiftwidth = 8,
}

for option in pairs(options) do
    vim.opt_local[option] = options[option]
end
