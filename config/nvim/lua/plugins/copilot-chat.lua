return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
        mappings = {
            reset = {
                normal = '',
                insert = '',
            }
        }
    },
    vim.keymap.set('n', '<leader>c', '<cmd>CopilotChatOpen<CR>', { noremap = true })
  },
 }
