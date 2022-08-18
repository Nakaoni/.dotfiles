local telescope_status_ok, telescope = pcall(require, "telescope")
if not telescope_status_ok then
    return
end

telescope.setup({
    defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "absolute" },
    },
    pickers = {
        find_files = {
            find_command = { "rg", "--files", "-uu", "-g", "!.git", "-g", "!var" },
            theme = "dropdown",
        }
    },
    extensions = {
        media_files = {}
    },
})

telescope.load_extension("live_grep_args")
