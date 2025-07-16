-- window managenemt
vim.keymap.set('n', '<leader>wv', '<C-w>v', { desc = 'split window [v]ertical' })
vim.keymap.set('n', '<leader>wh', '<C-w>h', { desc = 'split window [h]orizontal' })
vim.keymap.set('n', '<leader>we', '<C-w>=', { desc = 'split window [=] width' })
vim.keymap.set('n', '<leader>wc', ':close<CR>', { desc = '[c]lose split window' })

-- tab management
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', { desc = '[o]pen tab' })
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>', { desc = '[c]lose tab' })
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', { desc = '[n]ext tab' })
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', { desc = '[p]revious tab' })

-- general
vim.keymap.set('n', 'gx', ':!open <c-r><c-a><CR>', { desc = 'open URL' })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'clear highligh on escape' })
vim.keymap.set({'n', 'v', 'x'}, '<leader>y', '"+y', { desc = 'Yank to system clipboard' })
vim.keymap.set({'n', 'v', 'x'}, '<leader>p', '"+p', { desc = 'Paste from system clipboard' })
vim.keymap.set('n', '<leader>wq', ':wq<CR>', { desc = 'save and quit' })
vim.keymap.set('n', '<leader>qq', ':q!<CR>', { desc = 'quit without save' })
vim.keymap.set('n', '<leader>ww', ':w<CR>', { desc = 'save' })

-- navigating buffers
vim.keymap.set('n', '<leader>bb', '<C-^>', { desc = 'Switch to alternate buffer' })
vim.keymap.set('n', '<leader>bn', ':bnext<cr>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>bp', ':bprevious<cr>', { desc = 'Previous buffer' })

-- source current file / execute Lua code
vim.keymap.set('n', '<leader>xx', '<Cmd>source %<CR>', { desc = 'Source current file' })
vim.keymap.set('n', '<leader>x', '<Cmd>:.lua<CR>', { desc = 'Lua: execute current line' })
vim.keymap.set('v', '<leader>x', '<Cmd>:lua<CR>', { desc = 'Lua: execute current selection' })
