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

{
    "ryanoasis/vim-devicons",
    lazy = false,
    config = function()
		vim.o.encoding = "utf-8"
        vim.g.webdevicons_enable = 1
	end,
    opts = {},

}


}



