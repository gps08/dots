local package_info_path = vim.fs.find({ 'packageInfo' }, { upward = true, type = 'file' })[1]
if not package_info_path then return {} end

local project_path = vim.fn.fnamemodify(package_info_path, ':p:h')

local ws_folders_lsp = {}
local file = io.open(project_path .. '/.bemol/ws_root_folders', 'r')
if file then
  for line in file:lines() do
    table.insert(ws_folders_lsp, line)
  end
  file:close()
end

-- add all bemol listed folders to the workspace
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach-bemol', { clear = true }),
  callback = function()
    for _, line in ipairs(ws_folders_lsp) do
      vim.lsp.buf.add_workspace_folder(line)
    end
  end
})
