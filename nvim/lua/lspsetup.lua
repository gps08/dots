vim.lsp.enable({ 'bashls', 'c', 'luals', 'python', 'tsls', 'jdtls', 'kotlin' })
vim.diagnostic.config({
  virtual_text = true,
  signs = false,
  underline = true,
  severity_sort = true
})
