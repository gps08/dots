require 'options'
require 'lspsetup'
require 'bootstrap'

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
now(function() require('mini.starter').setup() end)
now(function()
  add({ source = 'vague2k/vague.nvim' })
  require('vague').setup({ transparent = true })
  vim.cmd('colorscheme vague')
  vim.api.nvim_set_hl(0, 'TabLineSel', { bg="#bbbbbb", fg="#000000" })
end)
now(function()
  require('mini.notify').setup({
    lsp_progress = {
      enable = false,
    }
  })
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
  })
  vim.api.nvim_create_autocmd('User', {
    pattern = 'MiniFilesBufferCreate',
    callback = function(args)
      local b = args.data.buf_id
      local function with_path(fn)
        return function()
          local path = (files.get_fs_entry(b) or {}).path
          if path then fn(path) else vim.notify('invalid entry') end
        end
      end
      local map = function(key, fn, desc) vim.keymap.set('n', key, fn, { buffer = b, desc = desc }) end
      map('<leader>s', with_path(function(p) vim.cmd('FzfLua live_grep cwd=' .. p) end), '[s]earch here')
      map('<leader>y', with_path(function(p) vim.fn.setreg('+', p) end), '[y]ank path')
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
later(function()
  require('mini.completion').setup()
  vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
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
    highlight = { enable = true },
    indent = { enable = true },
  })
end)
later(function()
  add({ source = 'folke/which-key.nvim' })
end)

require 'keymaps'
