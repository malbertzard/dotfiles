local settings = require("core.settings")

local themes = {
    nightfox = {
        "EdenEast/nightfox.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require("core.plugins.themes.nightfox")
        end
    },
    tundra = {
        "sam4llis/nvim-tundra",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require("core.plugins.themes.tundra")
        end
    },
    tokyonight = {
        "folke/tokyonight.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        branch = "main",
        config = function()
            require("core.plugins.themes.tokyonight")
        end
    },
    kanagawa = {
        "rebelot/kanagawa.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            vim.opt.background = settings.brightness
            vim.cmd("colorscheme kanagawa")
        end
    },
    oxocarbon = {
        "nyoom-engineering/oxocarbon.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            vim.opt.background = settings.brightness
            vim.cmd("colorscheme oxocarbon")
        end
    },
    gruvbox = {
        "luisiacc/gruvbox-baby",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            vim.opt.background = settings.brightness
            vim.cmd [[colorscheme gruvbox-baby]]
        end
    },
    caret = {
        "projekt0n/caret.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            vim.opt.background = settings.brightness
            vim.cmd [[colorscheme caret]]
        end
    },
    default = {
        "catppuccin/nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        name = "catppuccin",
        config = function()
            require("core.plugins.themes.catppuccin")
        end
    }
}

local selectedTheme = themes[settings.theme] or themes["default"]

return selectedTheme

