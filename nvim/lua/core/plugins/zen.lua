local M = {
  "folke/zen-mode.nvim",
  opts = {
    window = {
      options = {
        signcolumn = "no",     -- disable signcolumn
        number = true,         -- disable number column
        relativenumber = true, -- disable relative numbers
      },
    },
  },
  keys = {
    { "<leader>Tz", "<cmd>ZenMode<cr>", desc = "Toggle ZenMode" },
  }
}

return M
