local opts = {
  analysis = {
    autoSearchPaths = true,
    useLibraryCodeForTypes = true,
    diagnosticMode = 'openFilesOnly',
    diagnosticSeverityOverrides = {
      reportUnusedExpression = "none",
    },
  }
}

return opts
