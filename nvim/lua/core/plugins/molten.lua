local M = {
  {
    "benlubas/molten-nvim",
    build = ":UpdateRemotePlugins",
    init = function()
      -- these are examples, not defaults. Please see the readme
      -- TODO: look into image.nvim
      -- vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_image_provider = "none"
    end
  },
}

vim.g.python3_host_prog=vim.fn.expand("~/.virtualenvs/neovim/bin/python3")

return M
