return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        local telescope = require('telescope')
        telescope.load_extension('fzf')

        vim.keymap.set('', '<C-p>', '<cmd>Telescope find_files<CR>')
        vim.keymap.set('', '<C-f>', '<cmd>Telescope live_grep<CR>')
        vim.keymap.set('', '<C-b><C-b>', '<cmd>Telescope buffers<CR>')
        vim.keymap.set('', '<C-b><C-f>', '<cmd>Telescope current_buffer_fuzzy_find<CR>')
    end
}

