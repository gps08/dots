require 'options'
require 'lspsetup'
require 'bootstrap'

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
now(function() require('mini.starter').setup() end)
now(function()
  add({ source = 'vague2k/vague.nvim' })
  require('vague').setup({ transparent = true })
  vim.cmd('colorscheme vague')
  vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'NONE' })
end)
now(function()
  require('mini.notify').setup()
  vim.notify = require('mini.notify').make_notify()
end)
now(function() require('mini.icons').setup() end)
now(function()
  require('mini.files').setup({
    mappings = {
      go_in = '<Right>',
      go_out = '<Left>',
    },
    windows = {
      preview = true,
      width_preview = 80,
    },
    options = {
      use_as_default_explorer = false
    }
  })
end)
now(function() require('mini.statusline').setup() end)
now(function() require('mini.tabline').setup() end)
now(function() require('mini.pick').setup() end)

later(function() require('mini.ai').setup() end)
later(function() require('mini.comment').setup() end)
later(function() require('mini.diff').setup({}) end)
later(function() require('mini.git').setup() end)
later(function() require('mini.completion').setup() end)
later(function()
  add({ source = 'norcalli/nvim-colorizer.lua' })
  require('colorizer').setup({})
end)
later(function()
  add({
    source = 'nvim-treesitter/nvim-treesitter',
    checkout = 'master',
    monitor = 'main',
    hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
  })
  require('nvim-treesitter.configs').setup({
    ensure_installed = { 'lua', 'bash', 'vimdoc', 'c', 'cpp', 'csv', 'yaml', 'xml',
      'diff', 'python', 'java', 'javascript', 'markdown' },
  })
  vim.wo.foldmethod = 'expr'
  vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
end)
later(
  add({
    source = 'nvim-tree/nvim-tree.lua',
    depends = {
      'nvim-tree/nvim-web-devicons',
    }
  }),
  require('nvim-tree').setup({
  })
)
later(add({ source = 'folke/which-key.nvim' }))

require 'keymaps'
