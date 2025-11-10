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
  add({ source = 'ibhagwan/fzf-lua' })
  require('fzf-lua').setup({'border-fused'})
end)
now(function()
  local files = require('mini.files')
  files.setup({
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
  vim.api.nvim_create_autocmd('User', {
    pattern = 'MiniFilesBufferCreate',
    callback = function(args)
      local b = args.data.buf_id
      vim.keymap.set('n', 'gs', function()
        local path = (files.get_fs_entry() or {}).path
        if path == nil then return vim.notify('invalid entry') end
        vim.cmd('FzfLua files cwd=' .. path)
      end, { buffer = b, desc = '[s]earch here' })
      vim.keymap.set('n', 'gy', function()
          local path = (files.get_fs_entry() or {}).path
          if path == nil then return vim.notify('invalid entry') end
          vim.fn.setreg('+', path)
        end, { buffer = b, desc = '[y]ank path' })
    end,
  })
end)

now(function() require('mini.statusline').setup() end)
now(function() require('mini.sessions').setup() end)
now(function() require('mini.tabline').setup({ show_icons = false }) end)

later(function() require('mini.ai').setup() end)
later(function() require('mini.comment').setup() end)
later(function()
  add({ source = 'lewis6991/gitsigns.nvim' })
  require('gitsigns').setup({
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
      untracked = { text = '┆' },
    }
  })
end)
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
    view = {
      width = 50,
    },
  })
)
later(add({ source = 'folke/which-key.nvim' }))

require 'keymaps'
