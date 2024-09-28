local settings = require("core.settings")
local nvim_lsp = require("lspconfig")
local icons = require("core.utils.icons")

local lsp_settings = require("core.plugins.lsp.settings")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

require("core.utils.functions").on_attach(function(client, buffer)
  require("core.plugins.lsp.keys").on_attach(client, buffer)
end)

local _border = "single"

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = _border
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = _border
  }
)

vim.diagnostic.config {
  virtual_text = false,
  float = { border = _border },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
      [vim.diagnostic.severity.WARN] = icons.diagnostics.Warn,
      [vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
      [vim.diagnostic.severity.INFO] = icons.diagnostics.INFO,
    } },
  underline = true,
  update_in_insert = true,
  severity_sort = false,
}

for _, lsp in ipairs(settings.lsp_servers) do
  nvim_lsp[lsp].setup({
    capabilities = capabilities,
    flags = { debounce_text_changes = 150 },
    settings = {
      json = lsp_settings.json,
      yaml = lsp_settings.yaml,
      python = lsp_settings.python,
    },
  })
  ::continue::
end
