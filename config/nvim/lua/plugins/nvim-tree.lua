return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('nvim-tree').setup({
      view = {
        relativenumber = true,
        adaptive_size = true,
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = '▸',
              arrow_open = '▾',
            },
          },
        },
      },
      git = {
        show_on_dirs = false,
      },
    })
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.keymap.set('', '<C-n>', '<cmd>NvimTreeToggle<CR>')
  end
}
