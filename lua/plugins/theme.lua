return
{
--------------------------------------------------------------
-- colorscheme

{ 
        "bluz71/vim-moonfly-colors", 
        name = "moonfly", 
        lazy = false, 
        priority = 1000 ,
        
        config = function()
            vim.cmd('colorscheme moonfly')
        end,
},


-------------------------------------------------------------------

-- devicons 
{
    "ryanoasis/vim-devicons",
    lazy = false,
    config = function()
		vim.o.encoding = "utf-8"
        vim.g.webdevicons_enable = 1
	end,
    opts = {},

},

-------------------------------------------------------------------


-- status line 
{
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
},


------------------------------------------------------------------------

-- identation blackline 

{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },


------------------------------------------------------------------------
-- barbar plugins

--{
--    'romgrk/barbar.nvim',
--    dependencies = {
--      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
--      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
--    },
--    init = function() vim.g.barbar_auto_setup = true end,
--    opts = {},
--    version = '^1.0.0',
--},
--
----------------------------------------------------------------------

--nvim-tree setup

--{       
--        'kyazdani42/nvim-tree.lua',
--        dependencies = { 'kyazdani42/nvim-web-devicons' },
--        opts = {}
--},
--
------------------------------------------------------------------------
}



