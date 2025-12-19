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

mapLeader('w', '<cmd>update<CR>', '[w]rite')
mapLeader('W', '<cmd>wa<CR>', '[w]rite all')
mapLeader('q', '<cmd>q<CR>', '[q]uit')
mapLeader('c', '<cmd>bd<CR>', '[c]lose buffer')
mapLeader('r', '<cmd>source $MYVIMRC<CR>', '[r]eload config')
mapLeader('o', '<cmd>!open <c-r><c-a><CR>', '[o]pen URL')
mapLeader('O', '<cmd>Open .<cr>', '[o]pen in file expolrer')
mapLeader('y', '"+y', '[y]ank to system')
mapLeader('p', '"+p', '[p]aste from system')

mapLeader('s', '<cmd>e #<CR>', '[s]witch to last buffer')
mapLeader('S', '<cmd>vert sf #<CR>', '[s]plit with last buffer')

mapLeader('f', '<cmd>FzfLua files<CR>', 'search [f]iles')
mapLeader('h', '<cmd>FzfLua helptags<CR>', 'search [h]elp')
mapLeader('/', '<cmd>FzfLua live_grep<CR>', 'live grep')
mapLeader('<Tab>', '<cmd>FzfLua resume<CR>', 'live grep')
mapLeader('e', '<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>', '[e]xplore files')
mapLeader('t', '<cmd>NvimTreeToggle<CR>', '[n]vim tree toggle')

mapLeader('gd', '<cmd>Gitsigns diffthis HEAD<CR>', 'git [d]iff toggle')
mapLeader('gp', '<cmd>Gitsigns preview_hunk_inline<CR>', '[p]review hunk')
mapLeader('gr', '<cmd>Gitsigns reset_hunk<CR>', '[r]eset hunk')
mapLeader('gb', '<cmd>Gitsigns blame<CR>', 'git [b]lame')
mapLeader('gf', '<cmd>FzfLua git_diff<CR>', '[f]ind from changed files')

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
mapVisual('/s', '<cmd>FzfLua grep_visual<CR>', 'Search for selection as a [s]ymbol')
