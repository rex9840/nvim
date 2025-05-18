harpoon = require("harpoon")

vim.keymap.set("n", "<leader>aa", function() harpoon:list():add() end, {
        desc = "h[A]rpoon [A]dd file",
})
vim.keymap.set("n", "<leader>ae", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
        { desc = "h[A]rpoon [E]xplore" })
