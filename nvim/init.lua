require 'options'
require 'lspsetup'
require 'bootstrap'

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
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
    }
  })
end)
now(function() require('mini.statusline').setup() end)
now(function() require('mini.tabline').setup() end)
now(function() require('mini.pick').setup() end)

later(function() require('mini.comment').setup() end)
later(function()
  require('mini.diff').setup({
    view = {
      style = 'sign',
      signs = { add = '+', change = '~', delete = '-' }
    }
  })
end)
later(function() require('mini.git').setup() end)
later(function() require('mini.completion').setup() end)
later(function()
  add({
    source = 'nvim-treesitter/nvim-treesitter',
    checkout = 'master',
    monitor = 'main',
    hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
  })
  require('nvim-treesitter.configs').setup({
    ensure_installed = { 'lua', 'vimdoc' },
    highlight = { enable = true },
  })
end)
later(add({ source = 'folke/which-key.nvim' }))

require 'keymaps'
