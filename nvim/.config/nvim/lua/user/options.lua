-- :help options

local options = {
    cursorline = true, -- Cursor line activation
    number = true, -- Display line numbers
    relativenumber = true, -- Display line numbers relative to cursor position
    expandtab = true, -- Usage of spaces to insert a tab in Insert mode
    softtabstop = 4, -- Number of spaces for tabs
    shiftwidth = 4, -- Number of spaces to use for each step of (auto)indent
    autoindent = true, --
    clipboard = {"unnamedplus", "unnamed"},
    mouse = "a",
    ignorecase = true,
    hlsearch = true, --
    incsearch = true, --
    ruler = true, --
    showcmd = true, --
    so = 10, --
    fileencoding = "utf-8", --
    cmdheight = 2, --
    showtabline = 1, --
    smartcase = true, --
    smartindent = true, --
    splitbelow = true, --
    splitright = true, --
    numberwidth = 2, -- Width of the number column
    wrap = false, --
    scrolloff = 8, --
    sidescrolloff = 8, --
    termguicolors = false,
    swapfile = false,
}

for key, value in pairs(options) do
    vim.opt[key] = value
end
