-- linter formattor and lsp settings 

vim.keymap.set("n", "<leader>m", function() vim.lsp.buf.format() end)
