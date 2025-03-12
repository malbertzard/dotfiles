return {
  "malbertzard/project.nvim",
  -- "project.nvim",
  -- dir = "~/code/project.nvim",
  enabled = true,
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
