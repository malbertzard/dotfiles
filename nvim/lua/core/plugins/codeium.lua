local M = {
  "Exafunction/codeium.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  enabled = false,
  config = function()
    require("codeium").setup({
    })
  end
}

return M
