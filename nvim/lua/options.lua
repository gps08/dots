vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.inccommand = 'split'
vim.o.signcolumn = 'auto:1'
vim.o.backspace = 'indent,eol,start'
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.fixeol = false
vim.o.undofile = true
vim.o.scrolloff = 8
vim.o.foldmethod = 'indent'
vim.o.foldlevel = 999  -- higher number means less auto folding
vim.o.foldtext = ''
-- vim.o.wrap = false
-- vim.o.clipboard:append('unnamedplus')

-- ui stuff
vim.g.have_nerd_font = true
vim.g.icons_enabled = true
vim.o.termguicolors = true
vim.o.relativenumber = false
vim.o.number = true
vim.o.cursorline = true
vim.o.background = 'dark'
vim.o.splitright = true
vim.o.splitbelow = false
vim.o.mouse = 'a'
vim.o.mousemodel = 'extend'
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 0

-- custom commands
vim.api.nvim_create_user_command('Update', function() vim.pack.update() end, {})

-- autocommands
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})