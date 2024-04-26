local M = {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",

    'V13Axel/neotest-pest',
  },
  keys = {
    { "<leader>Tt", "<cmd>lua require('neotest').run.run()<cr>",                   desc = "Run Test Cursor" },
    { "<leader>Tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "Run Test File" },
    { "<leader>Ts", "<cmd>lua require('neotest').run.stop()<cr>",                  desc = "Stop Test" },
  },
  config = function()
    require('neotest').setup({
      consumers = {
        overseer = require("neotest.consumers.overseer"),
      },
      overseer = {
        enabled = true,
        -- When this is true (the default), it will replace all neotest.run.* commands
        force_default = true,
      },
      adapters = {
        require('neotest-pest')({
          pest_cmd = "./vendor/bin/pest",
        }),
      }
    })
  end

}

return M
