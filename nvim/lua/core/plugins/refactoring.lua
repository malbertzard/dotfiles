local M = {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("refactoring").setup()
  end,
  keys = {
    { "<leader>r",  "",                                                       desc = "+Refactor" },
  }
}

vim.keymap.set("x", "<leader>re", "<cmd>Refactor extract<cr>")
vim.keymap.set("x", "<leader>rf", "<cmd>Refactor extract_to_file<cr>")

vim.keymap.set("x", "<leader>rv", "<cmd>Refactor extract_var<cr>")

vim.keymap.set({ "n", "x" }, "<leader>ri", "<cmd>Refactor inline_var<cr>")

vim.keymap.set( "n", "<leader>rI", "<cmd>Refactor inline_func<cr>")

vim.keymap.set("n", "<leader>rb", "<cmd>Refactor extract_block<cr>")
vim.keymap.set("n", "<leader>rbf", "<cmd>Refactor extract_block_to_file<cr>")

return M
