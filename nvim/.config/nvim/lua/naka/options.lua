-- :help options
local vo = vim.opt

-- file encoding
vo.fileencoding = "utf-8"

-- number lines
vo.number = true
vo.relativenumber = true
vo.numberwidth = 4

-- chars to remove
vo.list = true
vo.lcs = "tab: >,trail:~,nbsp:+"

-- tab behavior
vo.expandtab = true
vo.softtabstop = 4
vo.shiftwidth = 4

-- indent
vo.autoindent = true

-- line
vo.cursorline = true

-- swap file
vo.swapfile = false

-- scroll behavior
vo.scrolloff = 10
vo.sidescrolloff = 10

-- search
vo.ignorecase = true
vo.hlsearch = true
vo.incsearch = true

-- split
vo.splitbelow = true
vo.splitright = true

vo.termguicolors = true

-- Enable mouse
vo.mouse = "a"

-- clipboard
vo.clipboard = { "unnamed", "unnamedplus" }
