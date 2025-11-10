local function mapNormal(key, action, desc)
  vim.keymap.set(
    'n', key, action,
    { desc = desc, silent = true }
  )
end
local function mapVisual(key, action, desc)
  vim.keymap.set(
    { 'v', 'x' }, key, action,
    { desc = desc, silent = true }
  )
end
local function mapAll(key, action, desc)
  mapNormal(key, action, desc)
  mapVisual(key, action, desc)
end
local function mapLeader(key, action, desc)
  mapAll('<leader>' .. key, action, desc)
end

mapLeader('w', ':w<CR>', '[w]rite')
mapLeader('ww', ':wa<CR>', '[w]rite all')
mapLeader('q', ':q<CR>', '[q]uit')
mapLeader('c', ':bd<CR>', '[c]lose buffer')
mapLeader('r', ':source ~/.config/nvim/init.lua<CR>', '[r]eload config')
mapLeader('o', ':!open <c-r><c-a><CR>', '[o]pen URL')
mapLeader('y', '"+y', '[y]ank to system')
mapLeader('p', '"+p', '[p]aste from system')

mapLeader('f', ':FzfLua files<CR>', 'search [f]iles')
mapLeader('h', ':FzfLua helptags<CR>', 'search [h]elp')
mapLeader('/', ':FzfLua live_grep<CR>', 'live grep')
mapLeader('<Tab>', ':FzfLua resume<CR>', 'live grep')
mapLeader('e', ':lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>', '[e]xplore files')
mapLeader('n', ':NvimTreeToggle<CR>', '[n]vim tree toggle')

mapLeader('gd', ':Gitsigns diffthis HEAD<CR>', 'git [d]iff toggle')
mapLeader('gp', ':Gitsigns preview_hunk_inline<CR>', '[p]review hunk')
mapLeader('gr', ':Gitsigns reset_hunk<CR>', '[r]eset hunk')
mapLeader('gb', ':Gitsigns blame<CR>', 'git [b]lame')
mapLeader('gf', ':FzfLua git_diff<CR>', '[f]ind from changed files')

mapLeader('lr', vim.lsp.buf.rename, '[r]ename symbol')
mapLeader('lf', vim.lsp.buf.format, '[f]ormat buffer')
mapLeader('la', vim.lsp.buf.code_action, 'code [a]ctions')
mapLeader('ld', vim.diagnostic.open_float, 'show [d]iagnostics')
mapLeader('lq', vim.diagnostic.setqflist, 'Set diagnostic quickfix list')

mapNormal('[q', vim.cmd.cprev, 'Previous quickfix item')
mapNormal(']q', vim.cmd.cnext, 'Next quickfix item')
mapNormal('[d', vim.diagnostic.goto_prev, 'Go to prev diagnostic message')
mapNormal(']d', vim.diagnostic.goto_next, 'Go to next diagnostic message')
mapNormal('<Esc>', '<cmd>nohlsearch<CR>', 'clear search highlight')
vim.keymap.set('i', 'M-p', '<C-r>"a', { desc = 'paste from " register' })

mapVisual('//', 'y:/<C-r>"<CR>', 'Search for selection in current file')
mapVisual('/s', ':FzfLua grep_visual<CR>', 'Search for selection as a [s]ymbol')
