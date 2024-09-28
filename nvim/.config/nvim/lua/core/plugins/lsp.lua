local M = {
  "neovim/nvim-lspconfig",
  -- event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "onsails/lspkind-nvim" },
    { "folke/neodev.nvim",   config = true, lazy = true, ft = "lua" },
    { "vxpm/ferris.nvim",    opts = {} }
  },
  config = function()
    require("core.plugins.lsp.lsp")
  end,
}

return M
