return {
    'mfussenegger/nvim-dap',
    config = function()
        local dap = require('dap')

        vim.keymap.set('', '<F5>', function() dap.continue() end)
        vim.keymap.set('', '<F9>', function() dap.set_breakpoint() end)
        vim.keymap.set('', '<F10>', function() dap.step_over() end)
        vim.keymap.set('', '<F11>', function() dap.step_into() end)
        vim.keymap.set('', '<F12>', function() dap.step_out() end)
        vim.keymap.set('', '+', function() dap.up() end)
        vim.keymap.set('', '-', function() dap.down() end)

        dap.adapters.cppdbg = {
            id = 'cppdbg',
            type = 'executable',
            command = '/home/manu/.local/share/nvim/mason/bin/OpenDebugAD7',
        }

        dap.configurations.cpp = {
            {
                name = 'Launch file',
                type = 'cppdbg',
                request = 'launch',
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopAtEntry = true,
            },
            {
                name = 'Attach to gdbserver :1234',
                type = 'cppdbg',
                request = 'launch',
                MIMode = 'gdb',
                miDebuggerServerAddress = 'localhost:1234',
                miDebuggerPath = '/usr/bin/gdb',
                cwd = '${workspaceFolder}',
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
            },
        }
    end
}
