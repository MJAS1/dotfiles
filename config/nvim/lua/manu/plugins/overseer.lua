return {
    'stevearc/overseer.nvim',
    config = function()
        require('overseer').setup({
            strategy = {
                'toggleterm'
            },
            default_vscode = {
                default = {
                    "on_output_summarize",
                    "on_exit_set_status",
                    "on_complete_notify",
                    "on_complete_dispose",
                    { "on_result_diagnostics_quickfix", open = true },
                    "on_result_diagnostics",
                },
            },

        })
        vim.keymap.set('', '<leader>o', '<cmd>OverseerRun<CR>', { remap = true })
    end
}
