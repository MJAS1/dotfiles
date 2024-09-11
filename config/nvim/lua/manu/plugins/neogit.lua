return {
  'NeogitOrg/neogit',
  config = function()
      local neogit = require('neogit')
      neogit.setup()
      vim.keymap.set('n', '<C-g><C-s>', '<cmd>Neogit kind=split_above<CR>')
  end,
}
