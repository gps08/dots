return {
  'lewis6991/gitsigns.nvim',
  event = 'VeryLazy',
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
      untracked = { text = '┆' },
    },
    signs_staged_enable = false,
    on_attach = function(bufnr)
      local gs = require('gitsigns')
      local map = function(key, rhs, desc)
        vim.keymap.set('n', '<leader>g' .. key, rhs, { buffer = bufnr, desc = desc })
      end
      map('s', gs.stage_hunk, '[s]tage')
      map('r', gs.reset_hunk, '[r]eset')
      map('p', gs.preview_hunk, '[p]review change')
      map('i', gs.preview_hunk_inline, '[p]review change [i]nline')
      map('S', gs.stage_buffer, '[S]tage buffer')
      map('R', gs.reset_buffer, '[R]eset buffer')
      map('b', gs.blame, '[b]lame lines')
      map('d', gs.diffthis, '[d]iff')
      map('tb', gs.toggle_current_line_blame, '[t]oggle [b]lame line')
      map('tw', gs.toggle_word_diff, '[t]oggle [w]ord diff')

      -- hunk navigation
      vim.keymap.set('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal({ ']c', bang = true })
        else
          gs.nav_hunk('next')
        end
      end, { buffer = bufnr })
      
      vim.keymap.set('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal({ '[c', bang = true })
        else
          gs.nav_hunk('prev')
        end
      end, { buffer = bufnr })
    end,
  },
}
