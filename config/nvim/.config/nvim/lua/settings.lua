local M = {}

-- theme: nightfox, tokyonight, tundra, kanagawa, gruvbox, caret, oxocarbon; default is catppuccin
-- refer to the themes settings file for different styles
M.brightness = "dark"
M.theme = "gruvbox_16"

M.treesitter_ensure_installed = {
    "bash",
    "go",
    "java",
    "javascript",
    "lua",
    "php",
    "rust",
    "c",

    "perl",
    "python",
    "julia",
    "r",

    "regex",
    "query",
    "vim",
    "markdown_inline",
    "http",

    "make",
    "cmake",
    "dockerfile",
    "editorconfig",
    "tmux",

    "gitcommit",
    "gitignore",

    "css",
    "html",
    "twig",

    "json",
    "jsonc",
    "toml",
    "yaml",

    "markdown",
    "latex",
}

-- LSPs that should be installed by Mason-lspconfig
M.lsp_servers = {
    -- General Purpose Langs
    "rust_analyzer",
    "gopls",
    "lua_ls",
    "pyright",

    -- Work JS Stuff
    -- "tsserver",

    -- Work Php Stuff
    "intelephense",
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
    "stylua"
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

M.icons = {
    diagnostics = {
        Error = " ",
        Hint = " ",
        Information = " ",
        Info = " ",
        Question = " ",
        Warning = " ",
        Warn = " ",
    },

    git = {
        Add = " ",
        Diff = " ",
        Ignore = " ",
        Mod = " ",
        Remove = " ",
        Rename = " ",
        Repo = " ",

    },

    gitsign = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
    },
}

return M
