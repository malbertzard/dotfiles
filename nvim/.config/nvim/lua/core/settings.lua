local M = {}

-- theme: nightfox, tokyonight, tundra, kanagawa, gruvbox, caret, oxocarbon; default is catppuccin
-- refer to the themes settings file for different styles
M.brightness = "dark"
M.theme = "gruvbox_16"
M.enable_noice = false
M.enable_db = false

-- random or see alpha/headers
M.alpha_header = "octopus"

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
  "php",
  "rust",
  "c",

  "python",
  "julia",
  "r",

  "regex",
  "query",
  "vim",
  "markdown_inline",
  "http",

  "cmake",
  "dockerfile",

  "css",
  "html",
  "twig",

  "json",
  "toml",
  "yaml",

  "markdown",
  "latex",
}

-- LSPs that should be installed by Mason-lspconfig
M.lsp_servers = {
  -- General Purpose Langs
  "gopls",
  "pyright",
  "lua_ls",
  "ruby_lsp",
  -- "clangd",
  "bashls",

  -- Work JS Stuff
  "tsserver",

  -- Work Php Stuff
  -- "phpactor",
  -- "antlersls",

  -- Markup Langs
  "jsonls",
  "yamlls",
  "marksman",
  "texlab",

  -- CSS Stuff
  -- "tailwindcss",
  -- "cssls",
}

-- Non LSP Tools that should be installed by Mason
M.tools = {
  "glow",

  -- Formatters
  -- "flake8",
  -- "rustywind",
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
