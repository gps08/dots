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
mapLeader('t', '<cmd>NvimTreeToggle<CR>', '[t]ree toggle')
mapLeader('tf', '<cmd>NvimTreeFindFile<CR>', '[t]ree [f]ind file')

mapLeader('gD', '<cmd>Gitsigns diffthis HEAD<CR>', 'git [D]iff toggle')
mapLeader('gd', '<cmd>Gitsigns preview_hunk_inline<CR>', '[d]iff review')
mapLeader('gr', '<cmd>Gitsigns reset_hunk<CR>', '[r]eset hunk')
mapLeader('gb', '<cmd>Gitsigns blame<CR>', 'git [b]lame')
mapLeader('gf', '<cmd>FzfLua git_diff<CR>', '[f]ind from changed files')
mapNormal(']g', '<cmd>Gitsigns next_hunk<CR>', '[n]ext diff hunk')
mapNormal('[g', '<cmd>Gitsigns prev_hunk<CR>', '[p]rev diff hunk')

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
mapVisual('/s', '<cmd>FzfLua grep_visual<CR>', 'Search for selection as [s]ymbol')
vim.keymap.set('v', '/f',
  function()
    local fzf = require('fzf-lua')
    local selection = require("fzf-lua.utils").get_visual_selection()
    fzf.files({ query = selection })
  end,
  { desc = 'Search for selection as [f]ile', silent = true }
)
