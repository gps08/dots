local function map(key, action, desc)
  vim.keymap.set(
    'n', '<leader>' .. key, action,
    { desc = desc, silent = true }
  )
end

-- window management
map('wv', '<C-w>v', 'split [v]ertical')
map('wh', '<C-w>s', 'split [h]orizontal')
map('we', '<C-w>=', 'split window [=] width')
map('wc', ':close<CR>', '[c]lose split window')

-- tab management
map('to', ':tabnew<CR>', '[o]pen tab')
map('tc', ':tabclose<CR>', '[c]lose tab')
map('tn', ':tabn<CR>', '[n]ext tab')
map('tp', ':tabp<CR>', '[p]revious tab')

-- clipboard operations
map('y', '"+y', 'Yank to system clipboard')
map('p', '"+p', 'Paste from system clipboard')

-- file operations
map('wq', ':wq<CR>', 'save and quit')
map('qq', ':q!<CR>', 'quit without save')
map('ww', ':w<CR>', 'save')

-- navigating buffers
map('bb', '<C-^>', 'Switch to alternate buffer')
map('bn', ':bnext<cr>', 'Next buffer')
map('bp', ':bprevious<cr>', 'Previous buffer')

-- source current file / execute Lua code
map('xx', '<Cmd>source %<CR>', 'Source current file')
map('x', '<Cmd>:.lua<CR>', 'Lua: execute current line')
vim.keymap.set('v', '<leader>x', '<Cmd>:lua<CR>', { desc = 'Lua: execute current selection' })

-- general
vim.keymap.set('n', 'gx', ':!open <c-r><c-a><CR>', { desc = 'open URL' })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'clear highlight on escape' })
vim.keymap.set({'n', 'v', 'x'}, '<leader>y', '"+y', { desc = 'Yank to system clipboard' })
vim.keymap.set({'n', 'v', 'x'}, '<leader>p', '"+p', { desc = 'Paste from system clipboard' })