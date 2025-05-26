return {
    'tpope/vim-unimpaired',
    config = function()
        vim.keymap.set('n', '<M-k>', '[e', { remap = true, desc = 'Move current line up' })
        vim.keymap.set('n', '<M-j>', ']e', { remap = true, desc = 'Move current line down' })
        vim.keymap.set('v', '<M-k>', '[egv', { remap = true, desc = 'Move selected lines up' })
        vim.keymap.set('v', '<M-j>', ']egv', { remap = true, desc = 'Move selected lines down' })
    end,
}
