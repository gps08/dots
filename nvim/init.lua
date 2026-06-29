require 'options'
require 'lspsetup'

-- plugins
vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' })
vim.pack.add({ 'https://github.com/vague2k/vague.nvim' })
vim.pack.add({ 'https://github.com/ibhagwan/fzf-lua' })
vim.pack.add({ 'https://github.com/lewis6991/gitsigns.nvim' })
vim.pack.add({ 'https://github.com/folke/which-key.nvim' })

-- colorscheme
require('vague').setup({ transparent = true })
vim.cmd('colorscheme vague')
vim.api.nvim_set_hl(0, 'TabLineSel', { bg="#bbbbbb", fg="#000000" })

-- plugin configs
require('mini.starter').setup()
require('mini.notify').setup({ lsp_progress = { enable = false } })
vim.notify = require('mini.notify').make_notify()
require('mini.icons').setup()
require('mini.files').setup({
  mappings = {
    go_in = '<Right>',
    go_out = '<Left>',
  },
  windows = {
    preview = true,
    width_preview = 80,
  },
})
require('mini.statusline').setup()
require('mini.sessions').setup()
require('mini.tabline').setup({
  show_icons = false,
  format = function(buf_id, label)
    local suffix = vim.bo[buf_id].modified and '[+]' or ''
    return MiniTabline.default_format(buf_id, label) .. suffix
  end,
})
vim.api.nvim_set_hl(0, 'MiniTablineModifiedCurrent', { link = 'MiniTablineCurrent' })
vim.api.nvim_set_hl(0, 'MiniTablineModifiedVisible', { link = 'MiniTablineVisible' })
vim.api.nvim_set_hl(0, 'MiniTablineModifiedHidden', { link = 'MiniTablineHidden' })
require('mini.ai').setup()
require('mini.comment').setup()
require('mini.completion').setup()
vim.o.completeopt = 'menu,menuone,noinsert,fuzzy,popup'
require('mini.cursorword').setup()
require('mini.hipatterns').setup({
  highlighters = {
    fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
    hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack' },
    todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo' },
    note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote' },
    hex_color = require('mini.hipatterns').gen_highlighter.hex_color(),
  },
})
require('mini.pairs').setup()
require('mini.bracketed').setup()
require('mini.move').setup()
require('mini.surround').setup()
require('fzf-lua').setup({'border-fused'})
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

vim.api.nvim_create_autocmd('User', {
  pattern = 'MiniFilesBufferCreate',
  callback = function(args)
    local files = require('mini.files')
    local b = args.data.buf_id
    local function with_path(fn)
      return function()
        local path = (files.get_fs_entry(b) or {}).path
        if path then fn(path) else vim.notify('invalid entry') end
      end
    end
    local map = function(key, fn, desc) vim.keymap.set('n', key, fn, { buffer = b, desc = desc }) end
    map('<leader>o', with_path(function(p) vim.cmd('FzfLua files cwd=' .. p) end), '[o]pen file')
    map('<leader>f', with_path(function(p) vim.cmd('FzfLua live_grep cwd=' .. p) end), '[f]ind using grep')
    map('<leader>y', with_path(function(p) vim.fn.setreg('+', p) end), '[y]ank path')
  end,
})

require 'keymaps'
