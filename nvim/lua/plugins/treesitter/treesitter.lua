local M = {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-refactor",
        "nvim-treesitter/nvim-treesitter-context",
        "HiPhish/nvim-ts-rainbow2",
        "nvim-treesitter/playground",
    },
    opts = {
        highlight = {
            enable = true,
            disable = function(lang, buf)
                local max_filesize = 100 * 1024 -- 100 KB
                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > max_filesize then
                    return true
                end
            end,
            additional_vim_regex_highlighting = false,
        },
        autopairs = { enable = true },
        autotag = { enable = true },
        indent = { enable = true },
        ensure_installed = {
            "vim",
            "markdown",
            "markdown_inline",
            "regex",
            "comment",
            "git_config",
            "git_rebase",
            "c",
            "css",
            "cmake",
            "vimdoc",
            "lua",
            "luadoc",
            "query",
            "php",
            "phpdoc",
            "typescript",
            "javascript",
            "jsdoc",
            "html",
            "go",
            "gomod",
            "rust",
            "yaml",
            "json",
            "bash",
            "python",
            "twig",
        },
        sync_install = true,
        ignore_install = {
        }, -- List of parsers to ignore installation
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "gnn", -- set to `false` to disable one of the mappings
                node_incremental = "grn",
                scope_incremental = "grc",
                node_decremental = "grm",
            },
        },
        refactor = {
            highlight_definitions = {
                enable = true,
                -- Set to false if you have an `updatetime` of ~100.
                clear_on_cursor_move = true,
            },
            highlight_current_scope = { enable = false },
        },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
        require'treesitter-context'.setup{}
        require "nvim-treesitter.configs".setup{}
        require('nvim-treesitter.configs').setup {
            rainbow = {
                enable = true,
                query = 'rainbow-parens',
                strategy = require('ts-rainbow').strategy.global,
            }
        }
    end,
}

return M
