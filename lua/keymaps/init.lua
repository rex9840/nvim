---------------------------------------------------------------------

require("keymaps.whichkey")
require("keymaps.error_diagnosis")
-- require("keymaps.barbar")
require("keymaps.telescope")
require("keymaps.lsp")

---------------------------------------------------------------------

-- clear search highlights 

vim.keymap.set("n", "<leader><space>", ":nohlsearch<CR>", { noremap = true, silent = true })
