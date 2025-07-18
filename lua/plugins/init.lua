---------------------------------------------------------------------

--lazy setup --

require("lazy").setup({

        { import = "plugins.git" },
        { import = "plugins.lsp" },
        { import = "plugins.qos_programing" },
        { import = "plugins.theme" },
        { import = "plugins.ai_helper" },
}, {})

---------------------------------------------------------------------
--lsp mason setup --

require("mason").setup({
        ui = {
                icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                },
        },
})

local servers = {
        clangd = {},
        pyright = {},
        gopls = {},
        rust_analyzer = {},
        bashls = {},
        html = { filetypes = { "html", "twig", "hbs" } },
        lua_ls = {
                Lua = {
                        workspace = { checkThirdParty = false },
                        telemetry = { enable = false },
                        diagnostics = { disable = { 'missing-fields' } },
                },
        },
}



local capabilities = vim.lsp.protocol.make_client_capabilities()
local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {})
require('mason-lspconfig').setup {
        ensure_install = ensure_installed,
        handlers = {
                function(server_name)
                        local server = servers[server_name] or {}
                        server.capabilities = capabilities
                        require('lspconfig')[server_name].setup(server)
                end,
        },
}


local null_ls = require("null-ls")
local eslint = require("eslint").setup({})

-- null_ls setup --
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
        sources = {
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettier,
        },

        formatting = {
                timeout_ms = 5000,
                async = true,
        },
})

-- Setup neovim lua configuration
require("neodev").setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

---------------------------------------------------------------------

-- auto complete setup --

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local cmp = require("cmp")
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
luasnip.config.setup({})

cmp.setup({
        snippet = {
                expand = function(args)
                        luasnip.lsp_expand(args.body)
                end,
        },
        completion = {
                completeopt = "menu,menuone,noinsert",
        },
        mapping = cmp.mapping.preset.insert({
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete({}),
                ["<CR>"] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                }),
        }),

        sources = {
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "path" },
                { name = "buffer" },
        },
})

---------------------------------------------------------------------
-- telescope setup --

require("telescope").setup({
        defaults = {
                file_ignore_patterns = { "*.git", "node_modules/*", ".venv/*" },
                theme = "center",
                sorting_strategy = "ascending",
                layout_config = {
                        horizontal = {
                                prompt_position = "top",
                                preview_width = 0.4,
                        },
                },
        },
})
require("telescope").load_extension("file_browser")
--[[for grep to work install ripgrep form the github : https://github.com/BurntSushi/ripgrep ]]
--[[for smooth control over telescope install fuzzy finder fzf from the github :https://github.com/junegunn/fzf ]]

---------------------------------------------------------------------
--comment.nvim setup --

require("Comment").setup()

----------------------------------------------------------------------
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

require("lualine").setup()
require("lualine").get_config()

---------------------------------------------------------------------------------

-- treesitter setup --

require("treesitter-context").setup({
        mode = "topline",


})

require("nvim-treesitter.configs").setup({
        -- Add languages to be installed here that you want installed for treesitter
        ensure_installed = {
                "c",
                "cpp",
                "go",
                "python",
                "rust",
                "tsx",
                "javascript",
                "typescript",
                "vimdoc",
                "vim",
                "bash",
                "lua",
                "gitcommit",
                "diff",
                "git_rebase",
                "markdown",
                "markdown_inline",
                "yaml",
        },
        auto_install = true,
        highlight = {
                enable = true,
                additional_vim_regex_highlighting = true,

        },
        indent = { enable = true },
})

-----------------------------------------------------------------------
-- outline
require("outline").setup({
        outline_window = {
                auto_close = true,
        },
        preview_window = {
                auto_preview = true,
        },
})


-----------------------------------------------------------------------


-- require("which-key").setup({
--         preset = "helix",
--         plugins = {
--                 presets = {
--                         operators = false,
--                         motions = false,
--                         text_objects = false,
--                         marks = false,
--                         registers = false,
--                 },
--
--         },
-- })

---------------------------------------------------------------------------------
require("nvim-tree").setup({
        auto_close = true,
        sort = {
                sorter = "case_sensitive",
        },
        view = {
                width = 30,
                side = "right",
        },
        renderer = {
                group_empty = true,
        },
        filters = {
                dotfiles = false,
        },
        actions = {
                open_file = {
                        quit_on_open = true,
                },
        },
        git = {
                ignore = false,
                timeout = 800,
        },
})


---------------------------------------------------------------------------------
--- harpoon setup --

local harpoon = require('harpoon')
harpoon:setup({})

---------------------------------------------------------------------------------
-- nvim-autopairs setup --

local npairs = require("nvim-autopairs")
npairs.setup({
        fast_wrap = {
                map = "<M-e>",
                chars = { "{", "[", "(", '"', "'" },
                pattern = [=[[%'%"%>%]%)%}%,]]=],
                end_key = "$",
                before_key = "h",
                after_key = "l",
                cursor_pos_before = true,
                keys = "qwertyuiopzxcvbnmasdfghjkl",
                manual_position = true,
                highlight = "Search",
                highlight_grey = "Comment",
        },
})

---------------------------------------------------------------------------------
---
