return {
    'kdheepak/lazygit.nvim',
    -- optional for floating window border decoration
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = function()
        vim.keymap.set('n', '<C-g><C-s>', '<cmd>LazyGit<CR>')
        vim.keymap.set('n', '<C-g><C-g>', '<cmd>LazyGitFilter<CR>')
    end
}
