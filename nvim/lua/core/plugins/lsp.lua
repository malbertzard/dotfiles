local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "onsails/lspkind-nvim" },
    { "folke/neodev.nvim",        config = true, lazy = true, ft = "lua" },
    -- { "simrat39/rust-tools.nvim", config = true, lazy = true, ft = "rust" }
  },
  config = function()
    require("core.plugins.lsp.lsp")
  end,
}

return M
