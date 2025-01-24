return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.vim" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {},
    vim.keymap.set('', '<leader>l', '<cmd>CopilotChatOpen<CR>', { remap = true })
  },
}
