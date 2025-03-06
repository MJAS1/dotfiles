return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.vim" },
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
    vim.keymap.set('n', '<leader>l', '<cmd>CopilotChatOpen<CR>', { remap = true })
  },
 }
