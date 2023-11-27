return {
    'tpope/vim-unimpaired',
    config = function()
        vim.keymap.set('n', '<M-k>', '[e', { remap = true })
        vim.keymap.set('n', '<M-j>', ']e', { remap = true })
        vim.keymap.set('v', '<M-k>', '[egv', { remap = true })
        vim.keymap.set('v', '<M-j>', ']egv', { remap = true })
    end,
}
