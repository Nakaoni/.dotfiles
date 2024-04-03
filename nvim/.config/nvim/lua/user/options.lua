-- :h options

options = {
    -- file encoding
    fileencoding = "utf-8",

    -- number lines
    number = true,
    numberwidth = 4,

    -- chars to remove
    list = true,
    lcs = "tab: >,trail:~,nbsp:+",

    -- tab behavior
    expandtab = true,
    softtabstop = 4,
    shiftwidth = 4,

    -- indent
    autoindent = true,

    -- line
    cursorline = true,

    -- swap file
    swapfile = false,

    -- scroll behavior
    scrolloff = 10,
    sidescrolloff = 10,

    -- search
    ignorecase = true,
    hlsearch = true,
    incsearch = true,

    -- split
    splitbelow = true,
    splitright = true,

    -- enable mouse
    mouse = "a",

    -- clipboard
    clipboard = "unnamedplus",

    -- global status line
    laststatus = 3
}


for option in pairs(options) do
    vim.opt[option] = options[option]
end

