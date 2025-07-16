local jdk21_home = '/Library/Java/JavaVirtualMachines/amazon-corretto-21.jdk/Contents/Home'
local path_to_jdtls = '/Volumes/workspace/javaLangServer'

local package_info_path = vim.fs.find({ 'packageInfo' }, { upward = true, type = 'file' })[1]
if not package_info_path then return {} end

local project_path = vim.fn.fnamemodify(package_info_path, ':p:h')
local project_dir = vim.fn.fnamemodify(project_path, ':t:r')
local cache_dir = os.getenv('HOME') .. '/.cache/jdtls/workspace/' .. project_dir

local ws_folders_lsp = {}
local file = io.open(project_path .. '/.bemol/ws_root_folders', 'r')
if file then
  for line in file:lines() do
    table.insert(ws_folders_lsp, line)
  end
  file:close()
end

return {
  root_dir = project_path,
  filetypes = { 'java' },
  cmd = {
    jdk21_home .. '/bin/java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-javaagent:' .. path_to_jdtls .. '/lombok.jar',
    '-jar', path_to_jdtls .. '/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
    '-configuration', path_to_jdtls .. '/config_mac',
    '-data', cache_dir,
  },
  init_options = {
    workspaceFolders = ws_folders_lsp
  },
  -- https://github.com/eclipse-jdtls/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line
  settings = {
    java = {
      eclipse = { downloadSources = true, },
      implementationsCodeLens = { enabled = true, },
      referencesCodeLens = { enabled = true, },
      references = { includeDecompiledSources = true, },
      signatureHelp = { enabled = true },
      format = { enabled = true },
      completion = {
        favoriteStaticMembers = {},
        importOrder = { 'java', 'javax', 'com', 'org', },
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
    },
    capabilities = vim.lsp.protocol.make_client_capabilities(),
    flags = {
      allow_incremental_sync = true,
    },
  }
}
