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

local fzf = require('fzf-lua')
local gitsigns = require('gitsigns')

mapLeader('w', '<cmd>update<CR>', '[w]rite')
mapLeader('W', '<cmd>wa<CR>', '[w]rite all')
mapLeader('q', '<cmd>q<CR>', '[q]uit')
mapLeader('u', '<cmd>!open <c-r><c-a><CR>', 'open [u]rl')
mapLeader('y', '"+y', '[y]ank to system')
mapLeader('p', '"+p', '[p]aste from system')
mapLeader('O', '<cmd>!open .<cr>', '[O]pen in file explorer')
mapLeader('e', function()
  local n = vim.api.nvim_buf_get_name(0)
  MiniFiles.open(n ~= '' and n or nil)
end, '[e]xplorer toggle')

mapLeader('o', fzf.files, '[o]pen file')
mapLeader('/', fzf.live_grep, '[f]ind using live grep')
mapLeader('f', fzf.grep, '[f]ind using grep')
mapLeader('F', fzf.resume, '[f]ind resume')
mapLeader('h', fzf.helptags, 'search [h]elp')
mapLeader('gf', fzf.git_diff, '[f]ind from changed files')
mapLeader('sd', fzf.lsp_definitions, 'go to definition')
mapLeader('sr', fzf.lsp_references, 'go to references')

mapLeader('gD', function() gitsigns.diffthis('HEAD') end, '[D]iff side-by-side toggle')
mapLeader('gd', gitsigns.preview_hunk_inline, '[d]iff inline')
mapLeader('gr', gitsigns.reset_hunk, '[r]eset hunk')
mapLeader('gB', gitsigns.blame, '[b]lame side-by-side')
mapLeader('gb', gitsigns.blame_line, '[b]lame inline')
mapNormal(']g', gitsigns.next_hunk, '[n]ext diff hunk')
mapNormal('[g', gitsigns.prev_hunk, '[p]rev diff hunk')

mapNormal('<A-c>', '<cmd>bd<CR>', 'close buffer')
mapNormal('<A-Tab>', '<cmd>e #<CR>', 'switch to last bufer')
mapNormal('<A-/>', '<cmd>vert sf #<CR>', 'vert split with last buffer')

mapNormal('<Esc>', '<cmd>nohlsearch<CR>', 'clear search highlight')
vim.keymap.set('i', '<M-p>', '<C-r>"', { desc = 'paste from " register' })

mapVisual('//', 'y:/<C-r>"<CR>', 'search for selection in current file')
mapVisual('/s', fzf.grep_visual, 'search for selection as [s]ymbol')
mapVisual('/f', function()
  fzf.files({
    query = require('fzf-lua.utils').get_visual_selection()
  })
end, 'search for selection as [f]ile')
