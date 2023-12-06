

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
