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
vim.opt.relativenumber = true


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


vim.o.softtabstop = 4
vim.o.tabstop = 4
vim.o.shiftwidth = 4


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




