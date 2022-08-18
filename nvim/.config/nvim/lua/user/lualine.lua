local lualine_status_ok, lualine = pcall(require, "lualine")
if not lualine_status_ok then
    return
end

local branch = {
    "branch",
    icons_enabled = true,
    icon = "",
}

-- cool function for progress
local progress = function()
    local current_line = vim.fn.line(".")
    local total_lines = vim.fn.line("$")
    local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return chars[index]
end

lualine.setup({
    options = {
        icons_enabled = true,
        theme = 'nightfly',
        component_separators = '',
        section_separators = '',
        disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
        always_divide_middle = true,
        globalstatus = false,
    },
    sections = {
        lualine_a = { branch },
        lualine_b = { 'filename', 'diff', 'diagnostics' },
        lualine_c = {},
        lualine_x = {},
        lualine_y = { { "location", padding = 1 } },
        lualine_z = { progress }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
})
