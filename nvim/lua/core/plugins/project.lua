local M = {
  "ahmedkhalf/project.nvim",
  event = "UIEnter",
  config = function()
    require("project_nvim").setup({
      patterns = {
        ".git",
        "package.json",
        "go.mod",
        "requirements.yml",
        "pyrightconfig.json",
        "pyproject.toml",
      },
      detection_methods = { "lsp", "pattern" },
    })
  end,
}

return M
