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
    'echasnovski/mini.comment',
    version = false,
    opts = {
      -- Options which control module behavior
      options = {
        -- Function to compute custom 'commentstring' (optional)
        custom_commentstring = nil,
        ignore_blank_line = false,
        start_of_line = false,
        pad_comment_parts = true,
      },
      mappings = {
        comment = 'gc',
        comment_line = 'gcc',
        comment_visual = 'gc',
        textobject = 'gc',
      }
    }
  },

}

return M
