return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.luarc.jsonc', '.git' },
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
        globals = { 'vim', 'MiniTabline', 'MiniFiles' },
        disable = { 'missing-fields' },
      },
      workspace = {
        library = { vim.env.VIMRUNTIME },
      },
      signatureHelp = { enabled = true },
    },
  },
}
