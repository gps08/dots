vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

require 'bootstrap'
require 'lspsetup'
require('lazy').setup({
  spec = {
    require 'plugins.colorscheme',
    require 'plugins.filetree',
    require 'plugins.lualine',
    require 'plugins.telescope',
    require 'plugins.treesitter',
    require 'plugins.treewalker',
    require 'plugins.gitsigns',
    require 'plugins.whichkey',
    require 'plugins.indent',
    {
      'catgoose/nvim-colorizer.lua', event='BufReadPre',
      config = function()
        require('colorizer').setup({})
      end
    },
  },
  install = { missing = true, colorscheme = { 'vague' } },
  checker = { enabled = true, notify = false },
  defaults = { lazy = true, version = false }
})

require 'options'
require 'keymaps'
