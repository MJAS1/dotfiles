return {
  'stevearc/conform.nvim',
  lazy = true,
  event = { 'BufReadPre', 'BufNewFile' }, -- to disable, comment this out
  config = function()
    local conform = require('conform')
    conform.setup({
      formatters_by_ft = {
        cpp = { 'clang-format' },
      },
      format_on_save = {
        async = false,
        timeout_ms = 1000,
      },
    })
  end,
}
