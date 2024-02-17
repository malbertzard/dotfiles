local settings = require("core.settings")
local nvim_lsp = require("lspconfig")

local lsp_settings = require("core.plugins.lsp.settings")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

require("core.utils.functions").on_attach(function(client, buffer)
  require("core.plugins.lsp.keys").on_attach(client, buffer)
end)

vim.diagnostic.config({
  virtual_text = false,
  float = {
    focusable = false,
    style = "minimal",
    border = "none",
    source = "always",
    header = "",
    prefix = "",
  },
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = false,
})

---- sign column
local signs = { Error = "", Warn = "", Hint = "", Info = "" }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

for _, lsp in ipairs(settings.lsp_servers) do
  if lsp == "rust_analyzer" then
    goto continue
  end
  nvim_lsp[lsp].setup({
    capabilities = capabilities,
    flags = { debounce_text_changes = 150 },
    settings = {
      lua = lsp_settings.lua,
      json = lsp_settings.json,
      yaml = lsp_settings.yaml,
      python = lsp_settings.python,
    },
  })
  ::continue::
end
