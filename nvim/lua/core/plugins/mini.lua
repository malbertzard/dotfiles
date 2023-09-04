local M = {

  {
    "echasnovski/mini.align",
    event = { "BufReadPre", "BufNewFile" },
    config = true,
  },

  {
    "echasnovski/mini.hipatterns",
    event = { "BufReadPre", "BufNewFile" },
    opts = function()
      local hi = require("mini.hipatterns")
      return {
        highlighters = {
          hex_color = hi.gen_highlighter.hex_color(),
        },
      }
    end,
  },

  {
    "echasnovski/mini.files",
    version = false,
    keys = {
      { "<leader>fe", "<cmd>lua MiniFiles.open()<cr>", desc = "File Explorer" }

    },
    opts = {}
  },

  {
    "echasnovski/mini.pairs",
    version = false,
    opts = {}
  },

  {
    "echasnovski/mini.move",
    version = false,
    opts = {}
  }
}

return M
