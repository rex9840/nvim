

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


--lsp config --

local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Create a command `:Format` local to the LSP buffer
  

  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

---------------------------------------------------------------------


--lsp mason setup -- 

require("mason").setup()
require("mason-lspconfig").setup(
{
 ensure_installed = { "lua_ls"},

})

local servers = {
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- rust_analyzer = {},
  -- tsserver = {},
  -- html = { filetypes = { 'html', 'twig', 'hbs'} },

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      -- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
      -- diagnostics = { disable = { 'missing-fields' } },
    },
  },
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

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
     },
  },

  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
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

---------------------------------------------------------------------------------

-- treesitter setup -- 

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
-- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
vim.defer_fn(function()
  require('nvim-treesitter.configs').setup {
    -- Add languages to be installed here that you want installed for treesitter
    ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'javascript', 'typescript', 'vimdoc', 'vim', 'bash' },

    -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
    auto_install = false,

    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<c-space>',
        node_incremental = '<c-space>',
        scope_incremental = '<c-s>',
        node_decremental = '<M-space>',
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ['aa'] = '@parameter.outer',
          ['ia'] = '@parameter.inner',
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          [']m'] = '@function.outer',
          [']]'] = '@class.outer',
        },
        goto_next_end = {
          [']M'] = '@function.outer',
          [']['] = '@class.outer',
        },
        goto_previous_start = {
          ['[m'] = '@function.outer',
          ['[['] = '@class.outer',
        },
        goto_previous_end = {
          ['[M'] = '@function.outer',
          ['[]'] = '@class.outer',
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ['<leader>a'] = '@parameter.inner',
        },
        swap_previous = {
          ['<leader>A'] = '@parameter.inner',
        },
      },
    },
  }
end, 0)

---------------------------------------------------------------------------------

