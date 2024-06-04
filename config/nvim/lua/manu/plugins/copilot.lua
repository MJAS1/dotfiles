return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  lazy = true,
  event = 'InsertEnter',
  config = function()
      require('copilot').setup({
          panel = {
              enabled = true,
              auto_refresh = true,
          },
          suggestion = {
              enabled = true,
              auto_trigger = true,
              keymap = {
                  accept_line = '<C-e>',
                  accept_word = '<M-f>',
              }
          },
          filetypes = {
              markdown = true,
              help = true,
          },
      })
  end,
}
