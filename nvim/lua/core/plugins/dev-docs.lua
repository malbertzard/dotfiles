return {
  "luckasRanarison/nvim-devdocs",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    { "<leader>H", "", desc = "+Help" },

    { "<leader>Hc", "<cmd>DevdocsOpenCurrent<cr>", desc = "DevDocs Current" },
    { "<leader>Ho", "<cmd>DevdocsOpen<cr>", desc = "DevDocs" },
  },
  opts = {
    ensure_installed = {
      "go",
      "html",
      "php",
      "bash",
      "zig",
      "javascript",
      "lua-5.4",
    }, -- get automatically installed
  }
}
