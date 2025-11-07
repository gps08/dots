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

mapLeader('f', ':Pick files<CR>', 'search [f]iles')
mapLeader('h', ':Pick help<CR>', 'search [h]elp')
mapLeader('/', ':Pick grep_live<CR>', 'live grep')
mapLeader('<Tab>', ':Pick resume<CR>', 'seach resume')
mapLeader('e', ':lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>', '[e]xplore files')
mapLeader('n', ':NvimTreeToggle<CR>', '[n]vim tree toggle')

mapLeader('gd', ':lua MiniDiff.toggle_overlay()<CR>', 'git [d]iff toggle')
mapLeader('gc', ':Git commit<CR>', 'git [c]ommit')
mapLeader('gb', ':vert Git blame -- %<CR>', 'git [b]lame')
mapLeader('ga', ':Git add %<CR>', 'git [a]dd')
mapLeader('gl', ':Git log<CR>', 'git [l]og')
mapLeader('gs', ':Git -C <cwd> status<CR>', 'git [s]tatus')
mapLeader('gf', function()
  local handle = io.popen('git diff --name-only --staged')
  if handle == nil then
    vim.notify('could not run git diff, got null response', vim.log.levels.INFO)
    return
  end
  local output = handle:read('*a')
  handle:close()
  local changed_files = {}
  for filename in output:gmatch('[^\r\n]+') do
    table.insert(changed_files, filename)
  end
  if #changed_files > 0 then
    require('mini.pick').start({
      source = { items = changed_files, format_item = function(item) return item end },
      action = function(item)
        vim.cmd('edit' .. item)
      end,
      prompt = 'Choose File:'
    })
    else
      vim.notify('No VCS changed files found.', vim.log.levels.INFO)
  end
end, '[f]ind from changed files')

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
mapNormal('M-p', '<C-r>"a', 'paste from " register')

mapVisual('//', 'y:/<C-r>"<CR>', 'Search for selection in current file')
mapVisual('/s', 'y:Pick grep_live<CR><C-r>"', 'Search for selection as a [s]ymbol')
mapVisual('/f', 'y:Pick files<CR><C-r>"', 'Search for selection as a [f]ile')
