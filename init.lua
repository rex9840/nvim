-- This is a init file to initiate the neovim 




--set leaderkey as <\>

vim.g.mapleader = '\\'
vim.g.maplocalleader = '\\'




------------------------------------------
-- loading the required setups for nvim

require("config")
require("plugins")
require("keymaps")

-----------------------------------------

-- setting setups --- 

--line numbers in the neovim 

vim.wo.number = true 
vim.opt.relativenumber = true


--clipboard sync 

vim.o.clipboard = 'unnamedplus'


