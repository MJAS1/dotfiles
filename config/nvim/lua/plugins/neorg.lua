return {
    {
        "vhyrro/luarocks.nvim",
        priority = 1000, -- We'd like this plugin to load first out of the rest
        config = true, -- This automatically runs `require("luarocks-nvim").setup()`
    },
    {
        "nvim-neorg/neorg",
        dependencies = { "luarocks.nvim" },
        config = function()
            require("neorg").setup({
                load = {
                    ["core.defaults"] = {},
                    ["core.concealer"] = {},
                    ["core.dirman"] = {
                        config = {
                            workspaces = {
                                notes = '~/.notes',
                            },
                            default_workspace = 'notes',
                        }
                    },
                }
            })
            vim.api.nvim_create_autocmd("Filetype", {
                pattern = "norg",
                callback = function()
                    vim.keymap.set("n", "<CR>", "<Plug>(neorg.esupports.hop.hop-link)", { buffer = true })
                end,
            })
        end,
    },
}
