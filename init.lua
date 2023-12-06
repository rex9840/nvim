-- This is a init file to initiate the neovim setup 



--set leaderkey as <\>

vim.g.mapleader = '\\'
vim.g.maplocalleader = '\\'




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



