
return 
{
---------------------------------------------------------
	-- nvim  directories tree structure -- 

	 {
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup {}
		end,
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

}