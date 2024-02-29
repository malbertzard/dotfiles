local M = {
  "anuvyklack/hydra.nvim",
  lazy = true,
  keys = {
    "<leader>z",
    "<leader>gM"
  },
  config = function()
    require("core.plugins.hydra.hydra")
  end,
}

return M
