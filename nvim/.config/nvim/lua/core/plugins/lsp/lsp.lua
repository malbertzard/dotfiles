local settings = require("core.settings")
local nvim_lsp = require("lspconfig")

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

vim.diagnostic.config{
  virtual_text = false,
  float={border=_border},
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = false,
}

---- sign column
local icons = require("core.utils.icons")
--
for type, icon in pairs(icons.diagnostics) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

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
