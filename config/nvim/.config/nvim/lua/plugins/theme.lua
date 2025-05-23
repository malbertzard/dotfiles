local settings = require("settings")

local themes = {
  kanagawa = {
    "rebelot/kanagawa.nvim",
    lazy = false,        -- make sure we load this during startup if it is your main colorscheme
    priority = 1000,     -- make sure to load this before all the other start plugins
    config = function()
      vim.opt.background = settings.brightness
      vim.cmd("colorscheme kanagawa")
    end
  },
  oxocarbon = {
    "nyoom-engineering/oxocarbon.nvim",
    lazy = false,        -- make sure we load this during startup if it is your main colorscheme
    priority = 1000,     -- make sure to load this before all the other start plugins
    config = function()
      vim.opt.background = settings.brightness
      vim.cmd("colorscheme oxocarbon")
    end
  },
  gruvbox = {
    "luisiacc/gruvbox-baby",
    lazy = false,        -- make sure we load this during startup if it is your main colorscheme
    priority = 1000,     -- make sure to load this before all the other start plugins
    config = function()
      vim.opt.background = settings.brightness
      vim.cmd [[colorscheme gruvbox-baby]]
    end
  },
  caret = {
    "projekt0n/caret.nvim",
    lazy = false,        -- make sure we load this during startup if it is your main colorscheme
    priority = 1000,     -- make sure to load this before all the other start plugins
    config = function()
      vim.opt.background = settings.brightness
      vim.cmd [[colorscheme caret]]
    end
  },
  gruvbox_16 = {
    "RRethy/base16-nvim",
    lazy = false,        -- make sure we load this during startup if it is your main colorscheme
    priority = 1000,     -- make sure to load this before all the other start plugins
    config = function()
      vim.opt.background = settings.brightness
      vim.cmd [[colorscheme base16-gruvbox-material-dark-medium]]
    end
  }
}

local default = "kanagawa"
local selectedTheme = themes[settings.theme] or themes[default]

return selectedTheme
