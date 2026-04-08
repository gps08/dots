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
mapLeader('u', '<cmd>!open <c-r><c-a><CR>', 'open [u]rl')
mapLeader('y', '"+y', '[y]ank to system')
mapLeader('p', '"+p', '[p]aste from system')

local function root_dir()
  local arg = vim.fn.argv(0)
  if arg ~= '' and vim.fn.isdirectory(arg) == 1 then
    return vim.fn.fnamemodify(arg, ':p')
  end
  return vim.fn.expand('%:p:h')
end
mapLeader('o', function() require('fzf-lua').files({ cwd = root_dir() }) end, '[o]pen file')
mapLeader('f', function() require('fzf-lua').live_grep({ cwd = root_dir() }) end, '[f]ind using live grep')
mapLeader('/', function() require('fzf-lua').grep({ cwd = root_dir() }) end, '[f]ind using grep')
mapLeader('F', '<cmd>FzfLua resume<CR>', '[f]ind resume')
mapLeader('h', '<cmd>FzfLua helptags<CR>', 'search [h]elp')
mapLeader('e', '<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>', '[e]xplorer toggle')
mapLeader('O', '<cmd>!open .<cr>', '[O]pen in file explorer')

mapLeader('gD', '<cmd>Gitsigns diffthis HEAD<CR>', 'git [D]iff toggle')
mapLeader('gd', '<cmd>Gitsigns preview_hunk_inline<CR>', '[d]iff review')
mapLeader('gr', '<cmd>Gitsigns reset_hunk<CR>', '[r]eset hunk')
mapLeader('gb', '<cmd>Gitsigns blame<CR>', 'git [b]lame')
mapLeader('gf', '<cmd>FzfLua git_diff<CR>', '[f]ind from changed files')
mapNormal(']g', '<cmd>Gitsigns next_hunk<CR>', '[n]ext diff hunk')
mapNormal('[g', '<cmd>Gitsigns prev_hunk<CR>', '[p]rev diff hunk')

mapLeader('lr', '<cmd>lua vim.lsp.buf.rename()<CR>', '[r]ename symbol')
mapLeader('lf', '<cmd>lua vim.lsp.buf.format()<CR>', '[f]ormat buffer')
mapLeader('la', '<cmd>lua vim.lsp.buf.code_action()<CR>', 'code [a]ctions')
mapLeader('ld', '<cmd>lua vim.diagnostic.open_float()<CR>', 'show [d]iagnostics')
mapLeader('lq', '<cmd>lua vim.diagnostic.setqflist()<CR>', 'Set diagnostic quickfix list')

mapNormal('<A-c>', '<cmd>bd<CR>', 'close buffer')
mapNormal('<A-Tab>', '<cmd>e #<CR>', 'switch to last bufer')
mapNormal('<A-/>', '<cmd>vert sf #<CR>', 'vert split with last buffer')

mapNormal(']b', '<cmd>bnext<CR>', 'next buffer')
mapNormal('[b', '<cmd>bprev<CR>', 'prev buffer')
mapNormal(']q', '<cmd>cnext<CR>', 'next quickfix item')
mapNormal('[q', '<cmd>cprev<CR>', 'prev quickfix item')
mapNormal(']d', '<cmd>lua vim.diagnostic.jump({ count=1 })<CR>', 'next diagnostic message')
mapNormal('[d', '<cmd>lua vim.diagnostic.jump({ count=-1 })<CR>', 'prev diagnostic message')
mapNormal('<Esc>', '<cmd>nohlsearch<CR>', 'clear search highlight')
vim.keymap.set('i', '<M-p>', '<C-r>"', { desc = 'paste from " register' })

mapVisual('//', 'y:/<C-r>"<CR>', 'search for selection in current file')
mapVisual('/s', '<cmd>FzfLua grep_visual<CR>', 'search for selection as [s]ymbol')
mapVisual('/f', function()
  require('fzf-lua').files({
    query = require('fzf-lua.utils').get_visual_selection()
  })
end, 'search for selection as [f]ile')
