return
{
        ---------------------------------------------------------

        -- auto complition --
        {
                'hrsh7th/nvim-cmp',
                dependencies = {
                        -- Snippet Engine & its associated nvim-cmp source
                        'L3MON4D3/LuaSnip',
                        'saadparwaiz1/cmp_luasnip',

                        -- Adds LSP completion capabilities
                        'hrsh7th/cmp-nvim-lsp',
                        'hrsh7th/cmp-path',

                        -- Adds a number of user-friendly snippets
                        'rafamadriz/friendly-snippets',
                },
        },
        ------------------------------------------------------------------

        --revover.vim for swap file handelling
        {
                "chrisbra/recover.vim",
                lazy = false,
                version = "*",
                config = function()
                        vim.g.recover_filetypes = "all"
                end,
        },
        --------------------------------------------------------------------

        -- Fuzzy Finder (files, lsp, etc)
        {
                'nvim-telescope/telescope.nvim',
                tag = '0.1.5',
                branch = '0.1.x',
                dependencies = {
                        'nvim-lua/plenary.nvim',
                },
        },
        ----------------------------------------------------------------------

        {

                -- Highlight, edit, and navigate code
                'nvim-treesitter/nvim-treesitter',
                dependencies = {
                        'nvim-treesitter/nvim-treesitter-textobjects',
                },
                build = ':TSUpdate',
        },

        -- key binding helper
        {
                'folke/which-key.nvim',
                event = "VeryLazy",
                init = function()
                        vim.o.timeout = true
                        vim.o.timeoutlen = 300
                end,
                opts = {}

        },

        ---------------------------------------------------------------------


        -- auto paring of brases columns

        {
                'windwp/nvim-autopairs',
                event = "InsertEnter",
                config = true,
                opts = {}
        },


        ---------------------------------------------------------------------


        -- telescope-file-browser

        {
                "nvim-telescope/telescope-file-browser.nvim",
                dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
        },

}
