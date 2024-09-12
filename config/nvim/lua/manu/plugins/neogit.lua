return {
  'NeogitOrg/neogit',
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
      local neogit = require('neogit')
      neogit.setup()
      vim.keymap.set('n', '<C-g><C-s>', '<cmd>Neogit kind=split_above<CR>')
  end,
}
