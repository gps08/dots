vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.backspace = 'indent,eol,start'
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.foldlevel = 10  -- higher number means less auto folding
vim.diagnostic.config({ virtual_text = true })
-- vim.opt.wrap = false
-- vim.opt.clipboard:append('unnamedplus')

-- ui stuff
vim.g.have_nerd_font = true
vim.g.icons_enabled = true
vim.opt.termguicolors = true
vim.opt.relativenumber = false
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.background = 'dark'
vim.opt.splitright = true
vim.opt.splitbelow = false
vim.opt.mouse = 'a'
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 0

-- autocommands
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
