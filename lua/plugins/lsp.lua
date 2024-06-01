return {

        {
                "neovim/nvim-lspconfig",
                'williamboman/mason.nvim',
                'williamboman/mason-lspconfig.nvim',
                cmd = 'Mason',
                build = ":MasonUpdate",
                opts = {
                        ensure_installed = {
                                "stylua",
                                "shfmt",
                                "flake8",
                        },

                },
        },
        ---------------------------------------------------------------------

        {


                -- LSP Configuration & Plugins
                'neovim/nvim-lspconfig',
                'nvimtools/none-ls.nvim',
                'MunifTanjim/eslint.nvim',
                dependencies = {
                        -- Automatically install LSPs to stdpath for neovim
                        'williamboman/mason.nvim',
                        'williamboman/mason-lspconfig.nvim',

                        -- Useful status updates for LSP
                        -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
                        { 'j-hui/fidget.nvim', opts = {} }, },
                'folke/neodev.nvim',
        },

        ---------------------------------------------------------------------


        -- Autocompletion
        {
                'hrsh7th/nvim-cmp',
                dependencies = {
                        -- Snippet Engine & its associated nvim-cmp source
                        'L3MON4D3/LuaSnip',
                        'saadparwaiz1/cmp_luasnip',

                        -- Adds LSP completion capabilities
                        'hrsh7th/cmp-nvim-lsp',

                        -- Adds a number of user-friendly snippets
                        'rafamadriz/friendly-snippets',
                },

        },

        --------------------------------------------------------------------

}
