return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  lazy = false,
  opts = {
    actions = {
      open_file = {
        window_picker = {
          enable = false
        },
      }
    },
    view = {
      width = 40,
    },
  },
  keys = {
    { '<leader>ee', '<cmd>NvimTreeToggle<cr>', desc = 'show [f]ile tree' },
    { '<leader>ef', '<cmd>NvimTreeFindFile<cr>', desc = '[f]ind file' },
  }
}
