local M = {
  "AckslD/nvim-FeMaco.lua",
  ft = {"markdown", "quarto"},
  keys = {
    { "<leader>Fe", "<cmd>FeMaco<cr>", "Edit Code Block" }
  },
  config = "require('femaco').setup()",
}

return M
