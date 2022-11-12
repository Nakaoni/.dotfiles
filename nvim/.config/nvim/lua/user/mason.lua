local status_ok, mason = pcall(require, "mason")
if not status_ok then
    print("Error loading Mason")
    return
end

mason.setup()
