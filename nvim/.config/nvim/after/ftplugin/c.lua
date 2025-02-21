-- :h options

local options = {
    -- tab behavior
    expandtab = true,
    softtabstop = 4,
    shiftwidth = 4,
}

for option in pairs(options) do
    vim.opt_local[option] = options[option]
end
