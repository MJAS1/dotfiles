return {
    'f-person/git-blame.nvim',
    config = function()
        require('gitblame').setup({
            message_template = '      <author> • <date> • <summary>'
        })
    end
}
