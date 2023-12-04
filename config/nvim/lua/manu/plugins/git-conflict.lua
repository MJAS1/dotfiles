return {
    'akinsho/git-conflict.nvim',
    version = "*",
    config = function()
        vim.cmd[[highlight Incoming guibg=#314753]]
        vim.cmd[[highlight Current guibg=#405d7e]]
        require('git-conflict').setup({
            highlights = {
                incoming = 'Incoming',
                current = 'Current',
            }
        })
    end
}
