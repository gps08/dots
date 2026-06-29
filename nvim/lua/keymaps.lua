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

mapLeader('o', require('fzf-lua').files, '[o]pen file')
mapLeader('/', require('fzf-lua').live_grep, '[f]ind using live grep')
mapLeader('f', require('fzf-lua').grep, '[f]ind using grep')
mapLeader('F', '<cmd>FzfLua resume<CR>', '[f]ind resume')
mapLeader('h', '<cmd>FzfLua helptags<CR>', 'search [h]elp')
mapLeader('e', '<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>', '[e]xplorer toggle')
mapLeader('O', '<cmd>!open .<cr>', '[O]pen in file explorer')

mapLeader('gD', '<cmd>Gitsigns diffthis HEAD<CR>', '[D]iff side-by-side toggle')
mapLeader('gd', '<cmd>Gitsigns preview_hunk_inline<CR>', '[d]iff inline')
mapLeader('gr', '<cmd>Gitsigns reset_hunk<CR>', '[r]eset hunk')
mapLeader('gb', '<cmd>Gitsigns blame<CR>', '[b]lame')
mapLeader('gf', '<cmd>FzfLua git_diff<CR>', '[f]ind from changed files')
mapNormal(']g', '<cmd>Gitsigns next_hunk<CR>', '[n]ext diff hunk')
mapNormal('[g', '<cmd>Gitsigns prev_hunk<CR>', '[p]rev diff hunk')

mapLeader('lr', '<cmd>lua vim.lsp.buf.rename()<CR>', '[r]ename symbol')
mapLeader('lf', '<cmd>lua vim.lsp.buf.format()<CR>', '[f]ormat buffer')
mapLeader('la', '<cmd>lua vim.lsp.buf.code_action()<CR>', 'code [a]ctions')
mapLeader('ld', '<cmd>lua vim.diagnostic.open_float()<CR>', 'show [d]iagnostics')
mapLeader('lq', '<cmd>lua vim.diagnostic.setqflist()<CR>', 'Set diagnostic quickfix list')
mapLeader('lh', '<cmd>lua vim.lsp.buf.hover()<CR>', 'hover documentation')
mapLeader('sd', '<cmd>FzfLua lsp_definitions<CR>', 'go to definition')
mapLeader('sr', '<cmd>FzfLua lsp_references<CR>', 'go to references')

mapNormal('<A-c>', '<cmd>bd<CR>', 'close buffer')
mapNormal('<A-Tab>', '<cmd>e #<CR>', 'switch to last bufer')
mapNormal('<A-/>', '<cmd>vert sf #<CR>', 'vert split with last buffer')

mapNormal('<Esc>', '<cmd>nohlsearch<CR>', 'clear search highlight')
vim.keymap.set('i', '<M-p>', '<C-r>"', { desc = 'paste from " register' })

mapVisual('//', 'y:/<C-r>"<CR>', 'search for selection in current file')
mapVisual('/s', '<cmd>FzfLua grep_visual<CR>', 'search for selection as [s]ymbol')
mapVisual('/f', function()
  require('fzf-lua').files({
    query = require('fzf-lua.utils').get_visual_selection()
  })
end, 'search for selection as [f]ile')
