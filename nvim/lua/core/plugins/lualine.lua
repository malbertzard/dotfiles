local settings = require("core.settings")

local M = {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    {
      "kyazdani42/nvim-web-devicons",
      lazy = true,
    },
  },
  opts = {
    options = {
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },

    },
    sections = {
      lualine_a = {},
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = {
        {
          "filename",
          file_status = true,    -- Displays file status (readonly status, modified status)
          newfile_status = true, -- Display new file status (new file means no write after created)
          path = 1,
        },
      },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = {},
      lualine_z = { "location" },
    },
    tabline = {
      lualine_a = { { "tabs", mode = 2 } }
    }
  },
}

return M
