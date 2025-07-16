return {
  {
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
        local gitsigns = require('gitsigns')
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal({']c', bang = true})
          else
            gitsigns.nav_hunk('next')
          end
        end)
        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal({'[c', bang = true})
          else
            gitsigns.nav_hunk('prev')
          end
        end)
        map('n', '<leader>gs', gitsigns.stage_hunk, { desc = '[s]tage' })
        map('n', '<leader>gr', gitsigns.reset_hunk, { desc = '[r]eset' })
        map('n', '<leader>gp', gitsigns.preview_hunk, { desc = '[p]review change' })
        map('n', '<leader>gi', gitsigns.preview_hunk_inline, { desc = '[p]review change [i]nline' })
        map('n', '<leader>gS', gitsigns.stage_buffer, { desc = '[S]tage buffer' })
        map('n', '<leader>gR', gitsigns.reset_buffer, { desc = '[R]eset buffer' })
        map('n', '<leader>gb', gitsigns.blame, { desc = '[b]lame lines' })
        map('n', '<leader>gd', gitsigns.diffthis, { desc = '[d]iff' })
        map('n', '<leader>gtb', gitsigns.toggle_current_line_blame, { desc = '[t]oggle [b]lame line' })
        map('n', '<leader>gtw', gitsigns.toggle_word_diff, { desc = '[t]oggle [w]ord diff' })
      end
    }
  }
}
