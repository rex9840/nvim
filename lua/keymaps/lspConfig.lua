local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end 

  local opts = { buffer = bufnr }
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation', opts)
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation', opts)
end


