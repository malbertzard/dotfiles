local M = {

  -- {
  --   "echasnovski/mini.surround",
  --   event = { "BufReadPre", "BufNewFile" },
  --   opts = {
  --     -- Number of lines within which surrounding is searched
  --     n_lines = 50,
  --
  --     -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
  --     highlight_duration = 500,
  --
  --     -- Module mappings. Use `''` (empty string) to disable one.
  --     mappings = {
  --       add = "sa", -- Add surrounding
  --       delete = "sd", -- Delete surrounding
  --       find = "sf", -- Find surrounding (to the right)
  --       find_left = "sF", -- Find surrounding (to the left)
  --       highlight = "sh", -- Highlight surrounding
  --       replace = "sr", -- Replace surrounding
  --       update_n_lines = "sn", -- Update `n_lines`
  --     },
  --   },
  -- },

  {
    "echasnovski/mini.align",
    event = { "BufReadPre", "BufNewFile" },
    -- is not loaded without explicitly saying it
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
}

return M
