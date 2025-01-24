return {
    'rcarriga/nvim-notify',
    config = function()
       vim.keymap.set('n', '<leader><leader>', require('notify').dismiss)
    end
}
