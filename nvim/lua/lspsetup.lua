vim.lsp.enable({ 'bashls', 'c', 'luals', 'python', 'tsls', 'jdtls', 'kotlin' })
vim.diagnostic.config({
  virtual_text = true,
  signs = false,
  underline = true,
  severity_sort = true
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local function mapLeader(key, action, desc)
      vim.keymap.set(
        { 'n', 'v', 'x' }, '<leader>' .. key, action,
        { desc = desc, silent = true, buffer = args.buf }
      )
    end

    mapLeader('lr', vim.lsp.buf.rename, '[r]ename symbol')
    mapLeader('lf', vim.lsp.buf.format, '[f]ormat buffer')
    mapLeader('la', vim.lsp.buf.code_action, 'code [a]ctions')
    mapLeader('ld', vim.diagnostic.open_float, 'show [d]iagnostics')
    mapLeader('lq', vim.diagnostic.setqflist, 'Set diagnostic quickfix list')
    mapLeader('lh', vim.lsp.buf.hover, 'hover documentation')
    mapLeader('lD', vim.lsp.buf.definition, 'goto [D]efinition')
    mapLeader('lR', vim.lsp.buf.references, 'goto [R]eferences')
  end,
})
