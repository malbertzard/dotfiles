local M = {
  "AckslD/nvim-FeMaco.lua",
  ft = { "markdown", "quarto" },
  keys = {
    { "<leader>Fe", "<cmd>lua require('femaco.edit').edit_code_block()<cr>", "Edit Code Block" }
  }
}

return M
