-- Neovim 0.9 configuration

local load_module = function(mod)
    local status_ok, err = pcall(require, mod)
    if not status_ok then
        print("Error loading module" .. mod)
        print(err)
    end
end

local user = os.getenv("USER")

print("Hello " .. user)

load_module("naka.options")
load_module("naka.utils")
load_module("naka.keymaps")
load_module("naka.plugin_manager")
