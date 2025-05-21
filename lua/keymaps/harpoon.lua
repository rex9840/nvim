harpoon = require("harpoon")

vim.keymap.set("n", "<leader>aa", function() harpoon:list():add() end, {
        desc = "h[A]rpoon [A]dd file",
})
vim.keymap.set("n", "<leader>ae", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
        { desc = "h[A]rpoon [E]xplore" })

vim.keymap.set("n", "<leader>ap", function() harpoon:list():prev() end, { desc = "h[A]rpoon [P]rev" })
vim.keymap.set("n", "<leader>an", function() harpoon:list():next() end, { desc = "h[A]rpoon [N]ext" }) 
