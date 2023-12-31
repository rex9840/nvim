return
{
--------------------------------------------------------------

{
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
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

}



