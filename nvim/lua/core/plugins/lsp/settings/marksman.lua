local opts = {
  -- also needs:
  -- $home/.config/marksman/config.toml :
  -- [core]
  -- markdown.file_extensions = ["md", "markdown", "qmd"]
  filetypes = { "markdown", "quarto" },
  root_dir = require("lspconfig.util").root_pattern(".git", ".marksman.toml", "_quarto.yml"),
}

return opts
