local status_ok, dap = pcall(require, "dap")
if not status_ok then
    return
end

dap.adapters.php = {
    type = 'executable',
    command = 'node',
    args = { os.getenv('HOME') .. '/.local/share/nvim/site/pack/packer/start/vscode-php-debug/out/phpDebug.js' }
}

dap.configurations.php = {
    {
        type = 'php',
        request = 'launch',
        name = 'Listen for Xdebug',
        port = 9007,
        log = os.getenv('HOME') .. '/.logs/phpDebug.log',
        ignore = { '!' .. os.getenv('HOME') .. '/*' }
    }
}

local ui_status_ok, dapui = pcall(require, 'dapui')
if not ui_status_ok then
    return
end

dapui.setup()
