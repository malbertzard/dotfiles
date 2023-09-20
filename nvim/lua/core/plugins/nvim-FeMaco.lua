local M = {
  "AckslD/nvim-FeMaco.lua",
  ft = "markdown",
  keys = {
    { "<leader>Fe", "<cmd>FeMaco<cr>", "Edit Code Block" }
  },
  config = "require('femaco').setup()",
}

return M
