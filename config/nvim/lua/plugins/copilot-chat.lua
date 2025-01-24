return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.vim" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    vim.keymap.set('', '<leader>l', '<cmd>CopilotChatOpen<CR>', { remap = true })
  },
}
