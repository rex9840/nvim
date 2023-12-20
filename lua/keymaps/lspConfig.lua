local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  local opts = { buffer = ev.buf }
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation', opts)
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation', opts)

  -- Create a command `:Format` local to the LSP buffer
  

  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

