vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end

    map("K", vim.lsp.buf.hover, "Hover Documentation")
    map("gd", vim.lsp.buf.definition, "Goto Declaration")
    map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
    map("<leader>gf", vim.lsp.buf.format, "Format")

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if not client then return end

    if client.supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = event.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = event.buf, id = client.id })
        end
      })
    end
  end,
})
