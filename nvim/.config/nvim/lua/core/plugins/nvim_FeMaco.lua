local M = {
  "AckslD/nvim-FeMaco.lua",
  ft = {"markdown", "quarto"},
  keys = {
    { "<localleader>E", "<cmd>FeMaco<cr>", "Edit Code Block" }
  },
  config = "require('femaco').setup()",
}

return M
