return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {},
  keys = {
    {
      '<leader>cc',
      '<cmd>CodeCompanionChat Toggle<CR>',
      desc = 'Toggle Code Companion Chat',
    },
    {
      '<leader>ca',
      '<cmd>CodeCompanionActions<CR>',
      desc = 'Open the action palette',
    },
    init = function()
      vim.cmd([[cab cc CodeCompanion]])
    end,
  },
  config = function()
    require('codecompanion').setup({
      display = {
        action_palette = {
          prompt = 'Prompt ',
          provider = 'telescope',
          opts = {
            show_default_actions = true,
            show_default_prompt_library = true,
          },
        },
      },
    })
  end,
}
