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
    "echasnovski/mini.pairs",
    version = false,
    opts = {}
  },

  {
    "echasnovski/mini.icons",
    version = false,
    opts = {
      style = "glyph"
    }
  },
}

return M
