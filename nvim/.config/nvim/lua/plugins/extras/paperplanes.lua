local M = {
  "rktjmp/paperplanes.nvim",

  keys = {
    {
      "<leader>mp",
      ":PP<CR>",
      mode = "n",
      desc = "Send Buffer to Pastebin Client",
    },
    {
      "<leader>mp",
      ":PP<CR>",
      mode = "v",
      desc = "Send Buffer to Pastebin Client",
    }
  }
}

return M
