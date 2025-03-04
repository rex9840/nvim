-- This is a init file to initiate the neovim setup

--set leaderkey as <space>

vim.g.mapleader = " "
vim.g.maplocalleader = " "

------------------------------------------
-- loading the required setups for nvim

require("config")
require("plugins")
require("keymaps")

-----------------------------------------

--line numbers in the neovim

vim.wo.number = true

--clipboard sync

vim.o.clipboard = "unnamedplus"

-- Save undo history

vim.o.undofile = true

--break indent enable

vim.o.breakindent = true

-- tab settings

vim.o.expandtab = true
vim.o.smarttab = true
vim.o.autoindent = true
vim.o.smartindent = true

--highlight on yank

local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
        callback = function()
                vim.highlight.on_yank()
        end,
        group = highlight_group,
        pattern = "*",
})

-- support for the terminal color

vim.o.termguicolors = true

-- dev icons

vim.g.webdevicons_enable = 1

--- netrw settings
vim.g.netrw_winsize = 25
vim.o.autochdir = true
vim.opt.termguicolors = true

-- cursor sizes

vim.o.guicursor = "i:block-Cursor"

-- relative line numbers
vim.o.relativenumber = true

-- Langauge

vim.opt.spelllang = "en_us"
vim.opt.spell = true

-- disable mouse

vim.o.mouse = ""

-- copilot  node configuration

local node_version = "v18.20.4"
local distribution = vim.fn.system("lsb_release -i -s")
distribution = distribution:gsub("%s+", "")

-- Set the node command based on the distribution
if distribution == "Ubuntu" then
        vim.g.copilot_node_command = string.format("~/.nvm/versions/node/%s/bin/node", node_version)

        -- install win32 yank for clipboard sync and support in wsl
        vim.g.clipboard = {
                name = "win32yank",
                copy = {
                        ["+"] = "win32yank.exe -i --crlf",
                        ["*"] = "win32yank.exe -i --crlf",
                },
                paste = {
                        ["+"] = "win32yank.exe -o --lf",
                        ["*"] = "win32yank.exe -o --lf",
                },
                cache_enabled = 0,
        }
end

-- disable swap file
vim.opt.swapfile = false
