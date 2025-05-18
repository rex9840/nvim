---------------------------------------------------------------------

require("keymaps.whichkey")
require("keymaps.error_diagnosis")
-- require("keymaps.barbar")
require("keymaps.telescope")
require("keymaps.lsp")
require("keymaps.nvim-tree")
require("keymaps.harpoon")

---------------------------------------------------------------------

-- clear search highlights 

vim.keymap.set("n", "<leader><space>", ":nohlsearch<CR>", { noremap = true, silent = true })
