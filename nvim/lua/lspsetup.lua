vim.lsp.enable({ 'bashls', 'c', 'luals', 'python', 'tsls', 'jdtls', 'kotlin' })

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('User', { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
      vim.keymap.set('i', '<C-Space>', vim.lsp.completion.get, { desc = 'autocomplete' })
    end
  end,
})

vim.diagnostic.config({
  virtual_text = true,
  signs = false,
  underline = true,
  severity_sort = true
})
