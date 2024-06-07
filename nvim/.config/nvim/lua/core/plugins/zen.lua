local M = {
  "folke/zen-mode.nvim",
  keys = {
    { "<leader>mTz", '<cmd>ZenMode<cr>', desc = "Zen Mode" },
  },
  opts = {
    window = {
      width = 100, -- width of the Zen window
      height = 1, -- height of the Zen window
      options = {
        signcolumn = "no",
        number = false,
        relativenumber = false,
        cursorline = false,
        cursorcolumn = false,
        foldcolumn = "0",
        list = false,
      },
    },
  }
}

return M
