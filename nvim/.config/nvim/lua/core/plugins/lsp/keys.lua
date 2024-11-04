local M = {}

M._keys = {
  { "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<cr>",   desc = "Goto Declaration" },
  { "<leader>ll", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "Line Diagnostics" },
  {
    "<leader>lr",
    function()
      require("inc_rename")
      return ":IncRename " .. vim.fn.expand("<cword>")
    end,
    expr = true,
    desc = "Rename",
    has = "rename",
  },
  { "gd",          "<cmd>Telescope lsp_definitions<cr>",                                    desc = "Goto Definition",     has = "definition" },
  { "gD",          "<cmd>Telescope lsp_type_definitions<cr>",                               desc = "Goto Type Definition" },
  { "K",           "<cmd>lua vim.lsp.buf.hover()<cr>",                                      desc = "Hover" },
  { "<c-k>",       "<cmd>lua vim.lsp.buf.signature_help()<cr>",                             mode = "i",                   desc = "Signature Help", has = "signatureHelp" },

  { "<leader>ld",  "<cmd>Telescope lsp_definitions<cr>",                                    desc = "Goto Definition",     has = "definition" },
  { "<leader>lR",  "<cmd>Telescope lsp_references<cr>",                                     desc = "References" },
  { "<leader>li",  "<cmd>Telescope lsp_implementations<cr>",                                desc = "Goto Implementation" },
  { "<leader>lt",  "<cmd>Telescope lsp_type_definitions<cr>",                               desc = "Goto Type Definition" },

  { "<leader>lf",  "<cmd>lua vim.lsp.buf.format()<cr>",                                     desc = "Format Buffer" },
  { "<leader>lr",  "<cmd>lua vim.lsp.buf.rename()<cr>",                                     desc = "Rename" },
  { "<leader>lS",  "<cmd>lua vim.lsp.buf.signature_help()<cr>",                             desc = "Signature Help",      has = "signatureHelp" },
  { "<leader>la",  "<cmd>lua vim.lsp.buf.code_action()<cr>",                                desc = "Code Action" },

  { "<leader>en",  "<cmd>lua vim.diagnostic.goto_next()<cr>",                               desc = "Next Diagnostic" },
  { "<leader>ep",  "<cmd>lua vim.diagnostic.goto_prev()<cr>",                               desc = "Prev Diagnostic" },
  { "<leader>eS",  "<cmd>Telescope diagnostics<cr>",                                        desc = "Search Diagnostics" },
  -- { "<leader>eq",  "<cmd>lua vim.diagnostic.setloclist()<cr>",                              desc = "Diagnostics in qflist" },
  { "<leader>es",  "<cmd>Telescope diagnostics bufnr=0<cr>",                                desc = "Search Document Diagnostics" },

  { "<leader>ls",  "<cmd>Telescope lsp_document_symbols<cr>",                               desc = "Document Symbols" },
  { "<leader>lws", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",                      desc = "Workspace Symbols" },
  { "<leader>lwa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>",                       desc = "Add Folder" },
  { "<leader>lwl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", desc = "List Folders" },
  { "<leader>lwr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>",                    desc = "Remove Folder" },


  { "<leader>mC",  "<cmd>lua print(vim.inspect(vim.lsp.get_active_clients()))<cr>",         desc = "Lsp Server Config" },
  { "<leader>lI",  "<cmd>LspInfo<cr>",                                                      desc = "Lsp Info" },
}

function M.on_attach(client, buffer)
  local opts = {}
  for _, keys in pairs(M._keys) do
    opts.has = nil
    opts.silent = true
    opts.buffer = buffer
    vim.keymap.set(keys.mode or "n", keys[1], keys[2], opts)
  end
end

return M
