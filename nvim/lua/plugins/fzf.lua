return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  config = function()
    local fzf = require('fzf-lua')
    fzf.setup({})
    fzf.register_ui_select()
    local function map(key, action, desc)
      vim.keymap.set(
        { 'n', 'v', 'i' },
        '<leader>/' .. key,
        function() action() end,
        { desc = desc, silent = true }
      )
    end
    map('a', fzf.builtin, 'search [a]ll')
    map('f', fzf.files, 'search [f]iles')
    map('b', fzf.buffers, 'search [b]uffers')
    map('q', fzf.quickfix, 'search [q]uickfix list')
    map('v', fzf.grep_visual, 'search [g]rep visual selection')
    map('g', fzf.live_grep, 'search live [g]rep')
    map('r', fzf.resume, 'search [r]esume')
  end
}
