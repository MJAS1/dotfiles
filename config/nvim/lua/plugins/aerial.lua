return {
    'stevearc/aerial.nvim',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons',
        'nvim-telescope/telescope.nvim',
    },
    config = function()
        require('aerial').setup({
            attach_mode = 'global',
            open_automatic = false,
            lazy_load = true,
            on_attach = function(bufnr)
                vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
                vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
            end,
        })
        require("telescope").setup({
            extensions = {
                aerial = {
                    -- Set the width of the first two columns (the second
                    -- is relevant only when show_columns is set to 'both')
                    col1_width = 4,
                    col2_width = 30,
                    -- How to format the symbols
                    format_symbol = function(symbol_path, filetype)
                        if filetype == "json" or filetype == "yaml" then
                            return table.concat(symbol_path, ".")
                        else
                            return symbol_path[#symbol_path]
                        end
                    end,
                    -- Available modes: symbols, lines, both
                    show_columns = "both",
                },
            },
        })
        require("telescope").load_extension("aerial")
        vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>')
        vim.keymap.set('n', '<leader>b', '<cmd>Telescope aerial<CR>')
    end
}
