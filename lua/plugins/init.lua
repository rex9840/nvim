

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

--lsp mason setup -- 

require("mason").setup()
require("mason-lspconfig").setup(
{
 ensure_installed = { "lua_ls", "rust_analyzer"},

})



local mason_lspconfig = require 'mason-lspconfig'
local servers = {
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      -- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
      -- diagnostics = { disable = { 'missing-fields' } },
    },
  },
}



mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end,
}



----------------------------------------------------------------------


-- auto complete setup -- 

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  --mapping = cmp.mapping.preset.insert {
  --  ['<C-n>'] = cmp.mapping.select_next_item(),
  --  ['<C-p>'] = cmp.mapping.select_prev_item(),
  --  ['<C-d>'] = cmp.mapping.scroll_docs(-4),
  --  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  --  ['<C-Space>'] = cmp.mapping.complete {},
  --  ['<CR>'] = cmp.mapping.confirm {
  --    behavior = cmp.ConfirmBehavior.Replace,
  --    select = true,
  --  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}




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
	-- Automatically hide the tabline when there are this many buffers left.
  	-- Set to any value >=0 to enable.
 	auto_hide = false,

	--A buffer to this direction will be focused (if it exists) when closing the current buffer.
	
	focus_on_close = 'previous', 
	
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
	
	no_name_title = nil,


}
----------------------------------------------------------------------------------

-- tokyonight setup -- 

vim.cmd[[colorscheme tokyonight-night]]


----------------------------------------------------------------------------------

-- lua line --

require('lualine').setup()


----------------------------------------------------------------------------------
