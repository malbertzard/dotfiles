local M = {}

-- theme: nightfox, tokyonight, tundra, kanagawa, gruvbox, oxocarbon; default is catppuccin
-- refer to the themes settings file for different styles
M.theme = "tundra"
M.global_statusline = true
-- set numbered lines
M.number = true
M.relative_number = true
M.mouse = "nv"
M.showtabline = 1
M.list = false
M.listchars = "eol:¬,tab:>·,trail:~,extends:>,precedes:<"
M.enable_noice = true
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
  "phpactor",
  "pyright",
  "lua_ls",
  "rust_analyzer",
  "tsserver",

  "jsonls",
  "yamlls",
  "marksman",
  "tailwindcss",
}

-- Tools that should be installed by Mason
M.tools = {
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
  "build/",
  "env/",
  "gradle/",
  "node_modules/",
  "smalljre_*/*",
  "target/",
  "vendor/*",
}

return M
