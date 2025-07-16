return {
  'nvim-lualine/lualine.nvim',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    options = {
      icons_enabled = true,
      theme = 'auto',
      component_separators = { left = '|', right = '|'},
      section_separators = { left = '', right = ''},
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      always_show_tabline = true,
      globalstatus = false,
      refresh = {
        statusline = 100,
        tabline = 100,
        winbar = 100,
      }
    },
    sections = {
      -- encoding, filetype, progress
      lualine_a = {{'mode', fmt=function(str) return str:sub(1,1) end }},
      lualine_b = {{'branch', icon=''}, 'diff', 'diagnostics'},
      lualine_c = {'filename'},
      lualine_x = {
        {
          'fileformat',
          symbols = { unix='', dos='', mac='' },
        },
      },
      lualine_y = {{'lsp_status', icons_enabled=false}},
      lualine_z = {'location'}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {'nvim-tree'}
  }
}
