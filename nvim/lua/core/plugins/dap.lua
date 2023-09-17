local settings = require("core.settings")

local M = {
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    enabled = settings.enable_dap,
    dependencies = {
      "mfussenegger/nvim-dap-python",
      "leoluz/nvim-dap-go",
      "rcarriga/nvim-dap-ui",
    },
  }
}

return M
