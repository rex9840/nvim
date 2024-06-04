---------------------------------------------------------------------

--lazy setup --

require('lazy').setup({

        { import = "plugins.git" },
        { import = "plugins.lsp" },
        { import = "plugins.qos_programing" },
        { import = "plugins.theme" },
        { import = "plugins.ai_helper" },

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
        nmap('<C-K>', vim.lsp.buf.signature_help, 'Signature Documentation')

        -- Create a command `:Format` local to the LSP buffer
        vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
                vim.lsp.buf.format()
        end, { desc = 'Format current buffer with LSP' })

        vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics, {
                        -- disable virtual text
                        virtual_text = false,
                        -- show signs
                        signs = true,
                }
        )
end


---------------------------------------------------------------------

--lsp mason setup --

require("mason").setup(
        {
                ui = {
                        icons = {
                                package_installed = "✓",
                                package_pending = "➜",
                                package_uninstalled = "✗"
                        }
                }
        }

)
require("mason-lspconfig").setup(
        {
                ensure_installed = { "lua_ls" },
                automatic_installation = true,
        })

local null_ls = require("null-ls")
local eslint = require("eslint")

null_ls.setup({
        sources = {
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.completion.spell,
        },
})



local servers = {
        clangd = {},
        pyright = {},
        rust_analyzer = {},
        tsserver = {},
        bashls = {},
        html = { filetypes = { 'html', 'twig', 'hbs' } },

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

require('telescope').setup(
        {
                defaults = {
                        scroll_strategy = "limit",
                        file_ignore_patterns = { ".git/[^h]" },
                        theme = "center",
                        sorting_strategy = "ascending",
                        layout_config = {
                                horizontal = {
                        prompt_position = "top",
                        preview_width = 0.3,
                        },
                },
        },
                pickers = {
                        find_files = {
                                hidden = true,
                        }
                },
                extensions = {
                        file_browser = {
                                mappings = {
                                        ["i"] = {}, ["n"] = {}, 
                                }, 
                        } 
                }
}) 

require("telescope").load_extension "file_browser"

---------------------------------------------------------------------

-- identation color setup

require("ibl").setup()

----------------------------------------------------------------------

-- barbar setup --

--require'barbar'.setup
--{
--	-- Automatically hide the tabline when there are this many buffers left.
--  	-- Set to any value >=0 to enable.
-- 	auto_hide = false,
--	-- Enable/disable animations
--	animation = true,
--	
--	tabpages = true,
--	
--	highlight_alternate = false,
--
--	highlight_inactive_file_icons = false,
--
--	focus_on_close = 'previous',
--	
--	separator = {left = '▎', right =''},
--	
--    	-- If true, add an additional separator at the end of the buffer list
--    	separator_at_end = true,
--
--        icons = {
--            -- Configure the base icons on the bufferline.
--            -- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
--            buffer_index = true,
--            buffer_number = false,
--            button = '',
--        },
--        filetype = {
--        -- Sets the icon's highlight group.
--        -- If false, will use nvim-web-devicons colors
--                custom_colors = true,
--
--        -- Requires `nvim-web-devicons` if `true`
--                enabled = true,
--        },
--        alternate = {filetype = {enabled = false}},
--        current = {buffer_index = true},
--        inactive = {button = '×'},
--        visible = {modified = {buffer_number = false}},
--
--	sidebar_filetypes = {
--	    Outline = {event = 'BufWinLeave', text = 'symbols-outline'},
--	},
--	no_name_title = nil,
--	letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
--}
----------------------------------------------------------------------------------


----------------------------------------------------------------------------------

-- lua line --

require('lualine').setup()

---------------------------------------------------------------------------------

-- treesitter setup --

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
vim.defer_fn(function()
        require('nvim-treesitter.configs').setup {
                -- Add languages to be installed here that you want installed for treesitter
                ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'javascript', 'typescript', 'vimdoc', 'vim', 'bash', 'lua' },

                -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
                auto_install = true,
        }
end, 0)

---------------------------------------------------------------------------------


--require("nvim-tree").setup({
--  sort = {
--    sorter = "case_sensitive",
--  },
--  view = {
--    width = 30,
--  },
--  renderer = {
--    group_empty = true,
--  },
--  filters = {
--    dotfiles = false,
--  },
--  git={
--          ignore = false,
--  }
--})

---------------------------------------------------------------------------------
-- nvim-autopairs setup --

local npairs = require('nvim-autopairs')
npairs.setup({
        fast_wrap = {
                map = '<M-e>',
                chars = { '{', '[', '(', '"', "'" },
                pattern = [=[[%'%"%>%]%)%}%,]]=],
                end_key = '$',
                before_key = 'h',
                after_key = 'l',
                cursor_pos_before = true,
                keys = 'qwertyuiopzxcvbnmasdfghjkl',
                manual_position = true,
                highlight = 'Search',
                highlight_grey = 'Comment'

        },
})

---------------------------------------------------------------------------------
