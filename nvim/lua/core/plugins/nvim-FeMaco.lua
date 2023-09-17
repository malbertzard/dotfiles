local M = {
  "AckslD/nvim-FeMaco.lua",
  ft = "md",
  keys = {
    { "<leader>Fe", "<cmd>FeMaco<cr>", "Edit Code Block" }
  },
  config = "require('femaco').setup()",
}

return M
