-- :h options

local options = {
    -- tab behavior
    expandtab = true,
    softtabstop = 2,
    shiftwidth = 2,
}

for option in pairs(options) do
    vim.opt_local[option] = options[option]
end

