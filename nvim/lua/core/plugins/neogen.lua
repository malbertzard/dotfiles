local M = {
  "danymat/neogen",
  config = true,
  keys = {
    { "<leader>af", ':lua require("neogen").generate({ type = "func" })<CR>', desc = "Function" },
    { "<leader>ac", ':lua require("neogen").generate({ type = "class" })<CR>', desc = "Class" },
    { "<leader>aF", ':lua require("neogen").generate({ type = "file" })<CR>', desc = "File" },
    { "<leader>at", ':lua require("neogen").generate({ type = "type" })<CR>', desc = "Type" },
  },
}

return M
