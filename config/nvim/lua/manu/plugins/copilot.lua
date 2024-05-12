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
          },
          filetypes = {
              markdown = true,
              help = true,
          },
      })

      vim.keymap.set('i', '<C-e>', require('copilot.suggestion').accept_line, {})
  end,
}
