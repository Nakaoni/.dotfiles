local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

-- Keymaps
vim.api.nvim_set_keymap("n", "<leader>m", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

nvim_tree.setup({
    create_in_closed_folder = true,
    update_focused_file = {
        enable = true,
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
    },
    git = {
        ignore = false,
    },
    view = {
        adaptive_size = true,
    },
    renderer = {
        icons = {
            glyphs = {
                default = "",
                symlink = "",
                git = {
                    unstaged = "",
                    staged = "S",
                    unmerged = "",
                    renamed = "➜",
                    deleted = "",
                    untracked = "U",
                    ignored = "◌",
                },
                folder = {
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                },
            },
        },
    },
})
