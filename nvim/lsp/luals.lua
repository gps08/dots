return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.luarc.jsonc', '.git'},
  telemetry = { enabled = false },
  formatters = {
    ignoreComments = false,
  },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
        disable = { 'missing-fields' },
      },
      signatureHelp = { enabled = true },
    },
  },
}
