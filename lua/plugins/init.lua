

print("--plugins initated--")


---------------------------------------------------------------------

--lazy setup -- 

require('lazy').setup({
	
	{import = "plugins.git"},
	{import = "plugins.lsp"},
	{import = "plugins.qos_programing"},
	{import = "plugins.theme"},
	{import = "plugins.ai_helper"},

}, {})

---------------------------------------------------------------------

--mason setup -- 

require("mason").setup()
require("mason-lspconfig").setup(
{
 ensure_installed = { "lua_ls", "rust_analyzer"},

})

---------------------------------------------------------------------

-- telescope setup -- 

require('telescope').setup()



---------------------------------------------------------------------

-- identation color setup

require("ibl").setup()

----------------------------------------------------------------------

-- barbar setup -- 

require'barbar'.setup
{
	
	sidebar_filetypes = {
	    -- Use the default values: {event = 'BufWinLeave', text = nil}
	    NvimTree = true,
	    -- Or, specify the text used for the offset:
	    undotree = {text = 'undotree'},
	    -- Or, specify the event which the sidebar executes when leaving:
	    ['neo-tree'] = {event = 'BufWipeout'},
	    -- Or, specify both
	    Outline = {event = 'BufWinLeave', text = 'symbols-outline'},
	  },



}
----------------------------------------------------------------------------------

-- tokyonight setup -- 

vim.cmd[[colorscheme tokyonight-night]]


----------------------------------------------------------------------------------

-- lua line --

require('lualine').setup()


----------------------------------------------------------------------------------
