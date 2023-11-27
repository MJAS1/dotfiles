return {
    'williamboman/mason.nvim',
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'jay-babu/mason-nvim-dap.nvim'
    },
    config = function()
        require('mason').setup({
            ui = {
                icons = {
                    package_installed = '✓',
                    package_pending = '➜',
                    package_uninstalled = '✗',
                }
            }
        })

        require('mason-lspconfig').setup({
            ensure_installed = {
                'bashls',
                'pyright',
                'rust_analyzer'
            },
            automatic_installation = true,
        })

        require('mason-nvim-dap').setup({
            ensure_installed = {
                'cpptools',
            },
            automatic_installation = true,
        })
    end
}
