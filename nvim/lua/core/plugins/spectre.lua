return {
  "windwp/nvim-spectre",
  keys = {
    { "<leader>fR", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
  },
}

