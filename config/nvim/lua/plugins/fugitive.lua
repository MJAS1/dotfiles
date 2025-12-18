return {
    'tpope/vim-fugitive',
    config = function()
        local map = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }

        map('n', '<C-g><C-s>', ':Git<CR><C-w>20+', opts)
        map('n', '<C-g><C-p>', ':Git add --patch %<CR>', opts)
        map('n', '<C-g><C-o>', ':Git commit -v<CR>', opts)
        map('n', '<C-g><C-l>', ':Git blame<CR>', opts)
        map('n', '<C-g><C-w>', ':Gwrite<CR>', opts)
        map('n', '<C-g><C-d>', ':Gdiffsplit!<CR>', opts)
        map('n', '<C-g><C-g>', ':Git graph<CR>', opts)

        vim.api.nvim_create_user_command(
            'Gpo',
            'Git push origin',
            { desc = 'Push to origin using Git Fugitive' }
        )
        vim.api.nvim_create_user_command(
            'Gpof',
            'Git push origin --force',
            { desc = 'Force push to origin using Git Fugitive' }
        )
        vim.api.nvim_create_user_command(
            'Gc',
            'Git commit -v',
            { desc = 'Commit using Git Fugitive' }
        )
        vim.api.nvim_create_user_command(
            'Gca',
            'Git commit --amend -v',
            { desc = 'Amend commit using Git Fugitive' }
        )
    end,
}
