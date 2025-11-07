return {
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_markers = { '.git' },
  -- https://microsoft.github.io/pyright/#/configuration
  settings = {
    python = {
      analysis = {
        autoImportCompletions = true,
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = 'openFilesOnly',
      },
    }
  }
}
