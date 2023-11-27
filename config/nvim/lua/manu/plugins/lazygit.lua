return {
    'kdheepak/lazygit.nvim',
    -- optional for floating window border decoration
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = function()
        vim.keymap.set('n', '<C-g>', '<cmd>LazyGit<CR>')
    end
}
