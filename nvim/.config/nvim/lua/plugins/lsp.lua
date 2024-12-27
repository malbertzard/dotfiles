local M = {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "onsails/lspkind-nvim" },
    { "folke/neodev.nvim",   config = true, lazy = true, ft = "lua" },
  },
  config = function()
    require("plugins.lsp.lsp")
  end,
}

return M
