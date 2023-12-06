

print("--plugins initated--")


---------------------------------------------------------------------

--lazy setup -- 

require('lazy').setup({
	
	{import = "plugins.git"},
	{import = "plugins.lsp"},
	{import = "plugins.qos_programing"}

}, {})

---------------------------------------------------------------------

--mason setup -- 

require("mason").setup()
require("mason-lspconfig").setup()

---------------------------------------------------------------------

-- telescope setup -- 

require('telescope').setup()



---------------------------------------------------------------------

