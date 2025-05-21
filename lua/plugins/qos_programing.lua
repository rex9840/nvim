return {
        ---------------------------------------------------------

        -- auto complition --
        {
                "hrsh7th/nvim-cmp",
                dependencies = {
                        -- Snippet Engine & its associated nvim-cmp source
                        "L3MON4D3/LuaSnip",
                        "saadparwaiz1/cmp_luasnip",

                        -- Adds LSP completion capabilities
                        "hrsh7th/cmp-nvim-lsp",
                        "hrsh7th/cmp-path",

                        -- Adds a number of user-friendly snippets
                        "rafamadriz/friendly-snippets",
                },
        },
        ------------------------------------------------------------------

        -- Fuzzy Finder (files, lsp, etc)
        {
                "nvim-telescope/telescope.nvim",
                dependencies = {
                        "nvim-lua/plenary.nvim",
                        "nvim-telescope/telescope-fzf-native.nvim",
                },
        },
        ----------------------------------------------------------------------

        {

                -- Highlight, edit, and navigate code
                "nvim-treesitter/nvim-treesitter",
                dependencies = {
                        "nvim-treesitter/nvim-treesitter-textobjects",
                        "nvim-treesitter/nvim-treesitter-context", 
                },
                build = ":TSUpdate",
        },

        -- key binding helper
        {
                "folke/which-key.nvim",
                dependencies = {
                        "echasnovski/mini.icons",
                        "nvim-tree/nvim-web-devicons",
                },
                event = "VeryLazy",
                opts = {},
        },

        ---------------------------------------------------------------------

        -- auto paring of brases columns

        {
                "windwp/nvim-autopairs",
                event = "InsertEnter",
                config = true,
                opts = {},
        },

        ---------------------------------------------------------------------
        --- Telescope file browser

        {
                "nvim-telescope/telescope-file-browser.nvim",
                dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        },

        ---------------------------------------------------------------------

        -- comment.vim
        {
                "numToStr/Comment.nvim",
                opts = {
                        -- add any options here
                },
                lazy = false,
        },

        ---------------------------------------------------------------------
        --- harpoon2

        {
                "ThePrimeagen/harpoon",
                branch = "harpoon2",
                dependencies = { "nvim-lua/plenary.nvim" }
        }


}
