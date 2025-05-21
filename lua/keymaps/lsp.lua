-- linter formattor and lsp settings

vim.keymap.set("n", "<leader>m", function()
        vim.lsp.buf.format()
end, {desc ='for[M]at'}
)

-- outline
vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })
