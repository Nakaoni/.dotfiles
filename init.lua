print("Welcome in Neovim, " .. os.getenv("USER") .. " !")

local load_module = function(name)
    local status_ok, err = pcall(require, name)

    if not status_ok then
        print("Error loading")
        print(err)
    end
end

load_module("naka.options")
load_module("naka.keymaps")
load_module("naka.plugins")
