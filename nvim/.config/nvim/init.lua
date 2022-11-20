-- Nakaoni's Neovim 0.8 configuration

local load_module = function(name)
    local status_ok = pcall(require, name)
    if not status_ok then
        print("Error loading " .. name)
    end
end

load_module("naka.options")
load_module("naka.keymaps")
load_module("naka.colorscheme")
load_module("naka.plugins")
load_module("naka.comment")
load_module("naka.lualine")
load_module("naka.nvimtree")
load_module("naka.completion")
load_module("naka.telescope")
load_module("naka.autopairs")
load_module("naka.bufferline")
load_module("naka.lsp")
load_module("naka.mason")
load_module("naka.dap")
load_module("naka.null-ls")
