local colorscheme = "rose-pine"

local status_ok, theme = pcall(require, colorscheme)
if not status_ok then
    vim.notify("Colorscheme " .. colorscheme .. " not installed !")
end

theme.setup({
    dark_variant = "moon",
    disable_italics = true,
})

vim.cmd("colorscheme rose-pine")
