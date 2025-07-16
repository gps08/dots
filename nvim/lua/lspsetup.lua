vim.lsp.enable({'clang', 'luals', 'python', 'tsls', 'jdtls', 'kotlin'})

local group = vim.api.nvim_create_augroup('lsp-attach-capabilities', { clear = true })
vim.api.nvim_create_autocmd('LspAttach', {
  group = group,
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.opt.completeopt = { 'menu','menuone','noinsert','fuzzy','popup' }
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
      vim.keymap.set('i', '<C-Space>', vim.lsp.completion.get, { desc = 'autocomplete' })
    end

    -- if not client:supports_method('textDocument/willSaveWaitUntil')
    --     and client:supports_method('textDocument/formatting') then
    --   vim.api.nvim_create_autocmd('BufWritePre', {
    --     group = vim.api.nvim_create_augroup('my.lsp', {clear=false}),
    --     buffer = args.buf,
    --     callback = function()
    --       vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
    --     end,
    --   })
    -- end

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'go to [d]efinition' })
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'go to [D]eclaration' })
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = 'go to [i]mplementation' })
    vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, { desc = 'go to t[y]pe definition' })
    vim.keymap.set('n', 'lr', vim.lsp.buf.references, { desc = 'list [r]eferences' })

    vim.keymap.set('n', '<leader>lw', vim.lsp.buf.workspace_symbol, { desc = 'list [w]orkspace symbols' })
    vim.keymap.set('n', '<leader>ls', vim.lsp.buf.document_symbol, { desc = 'list document [s]ymbols' })

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'show documentation' })
    vim.keymap.set('n', 'gK', vim.lsp.buf.signature_help, { desc = 'show signature' })
    vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, { desc = 'show signature' })

    vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { desc = '[r]ename symbol' })
    vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, { desc = 'code [a]ctions' })

    vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float, { desc = 'show [d]iagnostics' })
    vim.keymap.set('n', '<leader>lq', vim.diagnostic.setqflist, { desc = 'Set diagnostic quickfix list' })
    vim.keymap.set('n', '[q', vim.cmd.cprev, { desc = 'Previous quickfix item' })
    vim.keymap.set('n', ']q', vim.cmd.cnext, { desc = 'Next quickfix item' })
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to prev diagnostic message' })
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
    vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })

    -- vim.keymap.set('n', '<leader>lwa', vim.lsp.buf.add_workspace_folder, { desc = 'Workspace: [a]dd folder' })
    -- vim.keymap.set('n', '<leader>lwr', vim.lsp.buf.remove_workspace_folder, { desc = 'Workspace: [r]emove folder' })
    vim.keymap.set('n', '<leader>lf',
      function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
      { desc = 'Workspace: list [f]olders' }
    )
  end,
})

vim.diagnostic.config({ virtual_text = true })
