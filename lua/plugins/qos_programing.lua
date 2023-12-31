
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
	 { 'folke/which-key.nvim',
	  event = "VeryLazy",
	  init = function()
	    vim.o.timeout = true
	    vim.o.timeoutlen = 300
	  end,
	  opts = {} 
  	
  	},

---------------------------------------------------------------------

-- identation blackline 

{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },


----------------------------------------------------------------------

-- barbar plugins

{
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = true end,
    opts = {},
    version = '^1.0.0',
},


------------------------------------------------------------------------

-- status line 
{
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
},


------------------------------------------------------------------------

-- auto paring of brases columns

{
  'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} 
},

}
