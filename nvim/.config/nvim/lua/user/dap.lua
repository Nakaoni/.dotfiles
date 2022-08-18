local status_ok, dap = pcall(require, "dap")
if not status_ok then
    return
end

dap.adapters.php = {
    type = 'executable',
    command = 'node',
    args = { '/path/to/vscode-php-debug/out/phpDebug.js' }
}

dap.configurations.php = {
    {
        type = 'php',
        request = 'launch',
        name = 'Listen for Xdebug',
        port = 9000,
        log = '$HOME/.logs/phpDebug.log'
    }
}
