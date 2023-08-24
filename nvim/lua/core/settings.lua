local M = {}

-- theme: nightfox, tokyonight, tundra, kanagawa, gruvbox, oxocarbon; default is catppuccin
-- refer to the themes settings file for different styles
M.theme = "gruvbox"
M.enable_noice = false
M.enable_dap = false

M.showtabline = 1
M.global_statusline = true
M.mouse = "nv"

-- set numbered lines
M.number = true
M.relative_number = true

M.treesitter_ensure_installed = {
  "bash",
  "go",
  "java",
  "javascript",
  "lua",
  "python",
  "php",
  "rust",

  "regex",
  "query",
  "vim",

  "cmake",
  "dockerfile",

  "css",
  "html",
  "json",
  "toml",
  "yaml",
  "markdown",
  "markdown_inline",
}

-- LSPs that should be installed by Mason-lspconfig
M.lsp_servers = {
  "gopls",
  "pyright",
  "lua_ls",
  "tsserver",

  "phpactor",
  "antlersls",

  "jsonls",
  "yamlls",
  "marksman",

  "tailwindcss",
  "cssls",
}

-- Non LSP Tools that should be installed by Mason
M.tools = {
  "glow"
}

-- enable greping in hidden files
M.telescope_grep_hidden = true

-- which patterns to ignore in file switcher
M.telescope_file_ignore_patterns = {
  "%.7z",
  "%.JPEG",
  "%.JPG",
  "%.MOV",
  "%.RAF",
  "%.burp",
  "%.bz2",
  "%.cache",
  "%.class",
  "%.dll",
  "%.docx",
  "%.dylib",
  "%.epub",
  "%.exe",
  "%.flac",
  "%.ico",
  "%.ipynb",
  "%.jar",
  "%.jpeg",
  "%.jpg",
  "%.lock",
  "%.mkv",
  "%.mov",
  "%.mp4",
  "%.otf",
  "%.pdb",
  "%.pdf",
  "%.png",
  "%.rar",
  "%.sqlite3",
  "%.svg",
  "%.tar",
  "%.tar.gz",
  "%.ttf",
  "%.webp",
  "%.zip",
  ".git/",
  ".gradle/",
  ".idea/",
  ".settings/",
  ".vale/",
  ".vscode/",
  "__pycache__/*",
  "gradle/",
  "smalljre_*/*",
  "target/",
}

return M
