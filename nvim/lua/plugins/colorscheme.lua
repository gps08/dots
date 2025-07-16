return {
  -- {
  --   'navarasu/onedark.nvim',
  --   lazy = false, priority = 1000,
  --   config = function()
  --     require('onedark').setup {
  --       style = 'darker', -- opt: darker, cool, warmer, deep
  --       transparent = true,
  --     }
  --     require('onedark').load()
  --   end
  -- }
  {
    'vague2k/vague.nvim',
    lazy = false, priority = 1000,
    config = function()
      require('vague').setup({
        transparent = true,
      })
      vim.cmd('colorscheme vague')
    end
  }
  -- {
  --   'uloco/bluloco.nvim',
  --   lazy = false, priority = 1000,
  --   dependencies = { 'rktjmp/lush.nvim' },
  --   config = function()
  --     require('bluloco').setup({
  --       transparent = true,
  --     })
  --     vim.cmd('colorscheme bluloco')
  --   end
  -- }
  -- {
  --   'webhooked/kanso.nvim',
  --   lazy = false, priority = 1000,
  --   config = function()
  --     require('kanso').setup({
  --       theme = 'zen', -- 'zen', 'ink', 'mist'
  --       transparent = true,
  --       background = {
  --         dark = 'zen',
  --       }
  --     })
  --     vim.cmd('colorscheme kanso')
  --   end
  -- }
}
