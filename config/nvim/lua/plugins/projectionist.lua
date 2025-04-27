return {
    'tpope/vim-projectionist',
    config = function()
        vim.g.projectionist_heuristics = {
            ['*.c'] = {
                ['*.c'] = { type = 'source', alternate = '{}.h' },
                ['*.h'] = { type = 'header', alternate = '{}.c' },
            },
            ['*.cpp'] = {
                ['*.cpp'] = { type = 'source', alternate = '{}.hpp' },
                ['*.hpp'] = { type = 'header', alternate = '{}.cpp' },
            },
        }

        vim.keymap.set('n', '<M-o>', '<cmd>A<cr>', { desc = 'Projectionist: Go to alternate file' })
    end,
}

