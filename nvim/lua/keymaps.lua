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

mapLeader('wv', '<C-w>v', 'split [v]ertical')
mapLeader('wh', '<C-w>s', 'split [h]orizontal')
mapLeader('we', '<C-w>=', 'split window [=] width')
mapLeader('wc', ':close<CR>', '[c]lose split window')
mapLeader('to', ':tabnew<CR>', '[o]pen tab')
mapLeader('tc', ':tabclose<CR>', '[c]lose tab')
mapLeader('tn', ':tabn<CR>', '[n]ext tab')
mapLeader('tp', ':tabp<CR>', '[p]revious tab')
mapLeader('bn', ':bnext<cr>', '[n]ext buffer')
mapLeader('bp', ':bprevious<cr>', '[p]revious buffer')
mapLeader('bb', '<C-^>', 'Switch to alternate buffer')

mapLeader('w', ':w<CR>', '[w]rite')
mapLeader('q', ':q<CR>', '[q]uit')
mapLeader('c', ':bd<CR>', '[c]lose buffer')
mapLeader('s', ':update<CR> :source<CR>', '[s]ource')
mapLeader('r', ':source ~/.config/nvim/init.lua<CR>', '[r]eload config')
mapLeader('o', ':!open <c-r><c-a><CR>', '[o]pen URL')
mapLeader('y', '"+y', '[y]ank to system')
mapLeader('p', '"+p', '[p]aste from system')

mapLeader('f', ':Pick files<CR>', 'search [f]iles')
mapLeader('h', ':Pick help<CR>', 'search [h]elp')
mapLeader('/', ':Pick grep_live<CR>', 'live grep')
mapLeader('e', ':lua MiniFiles.open()<CR>', '[e]xplore files')
mapLeader('d', ':lua MiniDiff.toggle_overlay()<CR>', '[d]iff toggle')

mapLeader('lr', vim.lsp.buf.rename, '[r]ename symbol')
mapLeader('lf', vim.lsp.buf.format, '[f]ormat buffer')
mapLeader('la', vim.lsp.buf.code_action, 'code [a]ctions')
mapLeader('ld', vim.diagnostic.open_float, 'show [d]iagnostics')
mapLeader('lq', vim.diagnostic.setqflist, 'Set diagnostic quickfix list')
mapNormal('[q', vim.cmd.cprev, 'Previous quickfix item')
mapNormal(']q', vim.cmd.cnext, 'Next quickfix item')
mapNormal('[d', vim.diagnostic.goto_prev, 'Go to prev diagnostic message')
mapNormal(']d', vim.diagnostic.goto_next, 'Go to next diagnostic message')
mapNormal('<Esc>', '<cmd>nohlsearch<CR>', 'clear highlight on escape')
mapVisual('//', 'y/<C-r>"<CR>', 'Search for selection')
