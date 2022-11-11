local fn = vim.fn

-- Disable some builtin plugins.
local disabled_built_ins = {
    "2html_plugin",
    "gzip",
    "matchit",
    "rrhelper",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "logipat",
    "spellfile_plugin",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
}
for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Install packer.nvim if it's not installed.
local packer_bootstrap
local use = require("packer").use
--
-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

return require("packer").startup({
    function()
        use({ "wbthomason/packer.nvim" })
        use({ "nvim-lua/plenary.nvim", })

        use "samjwill/nvim-unception"

        -- These two plugins make CodeArt startup faster.
        use({
            "lewis6991/impatient.nvim",
            config = function()
                require("impatient")
            end,
        })

        -- Keybind and modes

        use { 
            "anuvyklack/hydra.nvim", key = "<leader>",
            config = function()
                require("plugins/hydra")
            end
        }

        use {
            "https://github.com/nat-418/scamp.nvim",
            config = function()
                require('scamp').setup({
                    -- see man(5) ssh_config for more control options
                    scp_options = {
                        'ConnectTimeout=5'
                    }
                })
            end
        }

        -- Color schemes.
        -- use({ "folke/tokyonight.nvim", })
        -- use({ "bluz71/vim-moonfly-colors", })
        -- use({ "shaunsingh/nord.nvim", })
        use { "catppuccin/nvim", as = "catppuccin" }

        --
        -- Editing Support
        --

        -- This plugin adds indentation guides to all lines (including empty lines).
        use({
            "lukas-reineke/indent-blankline.nvim",
            event = { "BufRead", "BufNewFile" },
            config = function()
                require("plugins/indent-blankline")
            end,
        })

        use { "kylechui/nvim-surround", config = function() require('nvim-surround').setup() end }
        use { "moll/vim-bbye" }
        use { "fedepujol/move.nvim", event = { "BufRead", "BufNewFile" } }
        use { "ThePrimeagen/harpoon", event = { "BufRead", "BufNewFile" } }
        use { "ahmedkhalf/project.nvim", config = function() require("plugins/project") end }
        use { "terrortylor/nvim-comment", event = { "BufRead", "BufNewFile" },
            config = function() require('nvim_comment').setup() end }

        use { "folke/trouble.nvim", event = { "BufRead", "BufNewFile" } }

        -- Auto closes.
        use({
            "windwp/nvim-autopairs",
            keys = {
                { "i", "(" },
                { "i", "[" },
                { "i", "{" },
                { "i", "'" },
                { "i", '"' },
                { "i", "<BS>" },
            },
            config = function()
                require("nvim-autopairs").setup()
            end,
        })
        -- This is for html and it can autorename too!
        use({
            "windwp/nvim-ts-autotag",
            ft = {
                "html",
                "javascript",
                "typescript",
                "javascriptreact",
                "typescriptreact",
                "svelte",
                "vue",
                "tsx",
                "jsx",
                "rescript",
                "xml",
                "php",
                "markdown",
                "glimmer",
                "handlebars",
                "hbs",
            },
        })


        --
        -- UI Components
        --

        -- Undo
        use {
            "jiaoshijie/undotree",
            config = function()
                require('undotree').setup()
            end,
            requires = {
                "nvim-lua/plenary.nvim",
            },
        }
        --
        -- Run Code
        use { 'stevearc/overseer.nvim', event = { "BufRead", "BufNewFile" },
            config = function() require('overseer').setup() end }

        -- File explorer tree.
        use({
            "kyazdani42/nvim-tree.lua",
            cmd = {
                "NvimTreeOpen",
                "NvimTreeFocus",
                "NvimTreeToggle",
            },
            config = function()
                require("plugins.nvim-tree")
            end,
        })

        -- Statusline.
        use({
            "nvim-lualine/lualine.nvim",
            event = { "BufRead", "BufNewFile" },
            config = function()
                require("plugins/lualine/lualine")
            end,
        })

        use {
            "nanozuki/tabby.nvim",
            event = { "BufRead", "BufNewFile" },
            config = function()
                require("plugins/tabby")
            end,
        }

        -- TreeSitter.
        use({
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            config = function()
                require("plugins/treesitter")
            end

        })

        use { "nvim-treesitter/nvim-treesitter-context", after = "nvim-treesitter" }


        -- Startup screen.
        use({
            "goolord/alpha-nvim",
            config = function()
                require("plugins/alpha")
            end,
        })

        -- Telescope
        use { "cljoly/telescope-repo.nvim", }
        use { "camgraff/telescope-tmux.nvim", }
        use { "nvim-neorg/neorg-telescope", }
        use { "nvim-telescope/telescope-file-browser.nvim" }
        use({
            "nvim-telescope/telescope.nvim",
            config = function()
                require("plugins/telescope")
            end,
        })

        -- LSP, LSP installer and tab completion.
        use({
            "williamboman/mason.nvim",
            config = function()
                require("mason").setup()
            end,
        })
        use({
            "williamboman/mason-lspconfig.nvim",
            after = "mason.nvim",
            config = function()
                require("mason-lspconfig").setup()
            end,
        })
        use({
            "neovim/nvim-lspconfig",
            after = "mason-lspconfig.nvim",
            config = function()
                require("plugins.lsp.lsp")
            end,
        })
        use({
            "jose-elias-alvarez/null-ls.nvim",
            after = "nvim-lspconfig",
        })

        use({
            "glepnir/lspsaga.nvim",
            config = function()
                require("plugins.lsp.lspsaga")
            end
        })

        use({
            "simrat39/symbols-outline.nvim",
            cmd = {
                "SymbolsOutline",
                "SymbolsOutlineOpen",
                "SymbolsOutlineClose",
            },
            config = function()
                require("plugins.symbols-outline")
            end,
        })

        use({
            "rafamadriz/friendly-snippets",
            event = "InsertEnter",
        })
        use({
            "L3MON4D3/LuaSnip",
            after = "friendly-snippets",
            config = function()
                require("luasnip.loaders.from_vscode").load()
                require("luasnip.loaders.from_snipmate").lazy_load()
            end,
        })
        use({
            "hrsh7th/nvim-cmp",
            after = "LuaSnip",
            config = function()
                require("plugins/cmp")
            end,
        })
        use({ "hrsh7th/cmp-buffer", after = "nvim-cmp", })
        use({ "hrsh7th/cmp-path", after = "nvim-cmp", })
        use({ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp", })
        use({ "saadparwaiz1/cmp_luasnip", after = "LuaSnip", })
        use({ "hrsh7th/cmp-nvim-lua", ft = "lua", })

        -- LSP signature.
        use({
            "ray-x/lsp_signature.nvim",
            event = "InsertEnter",
        })

        -- Neotest
        use { "nvim-neotest/neotest", event = { "BufRead", "BufNewFile" }, config = function()
            require("plugins/neotest")
        end }
        use { "nvim-neotest/neotest-plenary", event = { "BufRead", "BufNewFile" } }
        use { "nvim-neotest/neotest-vim-test", event = { "BufRead", "BufNewFile" } }
        use { "olimorris/neotest-phpunit", ft = { "php" } }
        use { "nvim-neotest/neotest-python", ft = { "py" } }

        -- Terminal.
        use({
            "akinsho/toggleterm.nvim",
            config = function()
                require("plugins/toggleterm")
            end,
        })

        -- Git
        use({
            "lewis6991/gitsigns.nvim",
            event = { "BufRead", "BufNewFile" },
            config = function()
                require("plugins/gitsigns")
            end,
        })

        use { 'TimUntersberger/neogit',
            event = { "BufRead", "BufNewFile" },
            requires = 'nvim-lua/plenary.nvim'
        }

        use({
            "sindrets/diffview.nvim",
            event = { "BufRead", "BufNewFile" }
        })

        --
        -- Eye Candy
        --

        -- Colorizer (for highlighting color codes).
        use({
            "NvChad/nvim-colorizer.lua",
            event = { "BufRead", "BufNewFile" },
            config = function()
                require("plugins/colorizer")
                vim.cmd("ColorizerAttachToBuffer")
            end,
        })

        -- Icons.
        use({
            "kyazdani42/nvim-web-devicons",
            event = { "BufRead", "BufNewFile" },
            config = function()
                require("plugins.nvim_web_devicons")
            end,
        })

        -- Smooth scroll.
        use({
            "karb94/neoscroll.nvim",
            event = { "BufRead", "BufNewFile" },
            config = function()
                require("plugins.neoscroll")
            end,
        })

        use { "stevearc/dressing.nvim", config = function()
            require('dressing').setup({})
        end }

        -- todo-comments is a lua plugin for Neovim to highlight and search for
        -- todo comments like TODO, HACK, BUG in code base.
        use({
            "folke/todo-comments.nvim",
            event = { "BufRead", "BufNewFile" },
            config = function()
                require("plugins/todo-comments")
            end,
        })

        -- A plugin for neovim that automatically creates missing directories
        -- on saving a file.
        use({
            "jghauser/mkdir.nvim",
            event = { "FileWritePre", "BufWritePre" },
            config = function()
                require("mkdir")
            end,
        })

        -- Neovim plugin to comment in/out text.
        use({
            "JoosepAlviste/nvim-ts-context-commentstring",
            after = "nvim-treesitter",
        })

        -- TrueZen.nvim is a Neovim plugin that aims to provide a cleaner and less cluttered interface
        -- when toggled in either of it has three different modes (Ataraxis, Minimalist and Focus).
        --
        -- Presentation
        use { "folke/twilight.nvim" }
        use { "folke/zen-mode.nvim", config = function()
            require("plugins/zen-mode")
        end }

        --
        -- File Type
        --

        -- Schema LSP
        use { "b0o/schemastore.nvim", ft = { "yml", "json", "toml" } }

        -- Norg
        use { "nvim-neorg/neorg",
            after = "nvim-treesitter",
            config = function()
                require("plugins/norg")
            end
        }

        -- Markdown
        use { "ellisonleao/glow.nvim", ft = "markdown" }
        use { "jubnzv/mdeval.nvim", ft = "markdown" }
        use { "AckslD/nvim-FeMaco.lua", ft = "markdown" }
        use { "jghauser/follow-md-links.nvim", ft = "markdown" }
        use { "jbyuki/venn.nvim" }
        use {
            'jghauser/auto-pandoc.nvim',
            ft = "markdown",
            requires = 'nvim-lua/plenary.nvim',
            config = function()
                require('auto-pandoc')
            end
        }


        -- Run :PackerSync if packer.nvim was not installed and
        -- CodeArt installed that.
        if packer_bootstrap then
            require("packer").sync()
        end
    end,
    config = {
        -- Default compile path of packer_compiled file.
        compile_path = fn.stdpath("config") .. "/plugin/" .. "packer_compiled.lua",
        git = {
            clone_timeout = 300,
        },
        -- Adding single border to packer window.
        display = {
            open_fn = function()
                return require("packer.util").float({ border = "single" })
            end,
        },
    },
})
