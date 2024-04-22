-- This is a init file to initiate the neovim setup 


--set leaderkey as <space>

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '




------------------------------------------
-- loading the required setups for nvim

require("config")
require("plugins")
require("keymaps")

-----------------------------------------


--line numbers in the neovim 

vim.wo.number = true 


--clipboard sync 

vim.o.clipboard = 'unnamedplus'


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

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})


-- support for the terminal color 

vim.o.termguicolors = true

-- dev icons

vim.g.webdevicons_enable = 1

--- netrw settings 
vim.g.netrw_winsize = 25
vim.o.autochdir = true

-- cursor sizes

vim.o.guicursor = 'i:block-Cursor'

-- relative line numbers
vim.o.relativenumber = true 
