

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
 ensure_installed = { "lua_ls"},

})



---------------------------------------------------------------------

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
  mapping = cmp.mapping.preset.insert {
     ['<C-n>'] = cmp.mapping.select_next_item(),
     ['<C-p>'] = cmp.mapping.select_prev_item(),
     ['<C-d>'] = cmp.mapping.scroll_docs(-4),
     ['<C-f>'] = cmp.mapping.scroll_docs(4),
     ['<C-Space>'] = cmp.mapping.complete {},
     ['<CR>'] = cmp.mapping.confirm {
       behavior = cmp.ConfirmBehavior.Replace,
       select = true,
     },},
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


vim.g.barbar_auto_setup = false

require'barbar'.setup
{
	-- Automatically hide the tabline when there are this many buffers left.
  	-- Set to any value >=0 to enable.
 	auto_hide = false,
	-- Enable/disable animations 
	animation = true,
	
	tabpages = true,
	
	highlight_alternate = false,

	highlight_inactive_file_icons = false,

	focus_on_close = 'previous',
	
	separator = {left = '▎', right = ''},
	
    	-- If true, add an additional separator at the end of the buffer list
    	separator_at_end = true,

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
	letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',


}
----------------------------------------------------------------------------------

-- tokyonight setup -- 

vim.cmd[[colorscheme tokyonight-night]]


----------------------------------------------------------------------------------

-- lua line --

require('lualine').setup()


----------------------------------------------------------------------------------
