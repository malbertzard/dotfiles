-- adopted from https://github.com/AdamWhittingham/vim-config/blob/nvim/lua/config/startup_screen.lua
-- use with nvim -u minimal_init_lazy.lua
local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require("alpha.themes.dashboard")

local buttons = {
  type = "group",
  val = {
    dashboard.button("b", "  File Browser", ":Telescope file_browser grouped=true <CR>"),
    dashboard.button("r", " " .. " Search Git Repos", ":Telescope repo list theme=ivy<CR>"),
    dashboard.button("p", "  Search Projects", ":Telescope projects theme=ivy<CR>"),
    -- dashboard.button("R", " " .. " Repo Config", ":e ~/.config/rw/config.yaml <CR>"),
    dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
    dashboard.button("l", "💤 Lazy", ":Lazy<CR>"),
    dashboard.button("q", "  Quit", ":qa<CR>"),
  },
  opts = {
    spacing = 1
  },
  position = "center",
}

local header = {
  type = "text",
  -- From https://gist.github.com/sRavioli/d6fb0a813b6affc171976b7dd09764d3
  -- val = require("core.plugins.alpha.headers")["random"],
  val = require("core.plugins.alpha.headers").imgs.octopus,
  opts = {
    position = "center",
    hl = "AlphaHeader",
  },
}

local footer = {
  type = "text",
  val = "“Simplicity, carried to the extreme, becomes elegance.”",
  opts = { hl = "SpecialComment", position = "center" },
}

local layout = {}
layout[0] = { type = "padding", val = 2 }
layout[1] = header
layout[2] = { type = "padding", val = 2 }
layout[3] = buttons
layout[4] = { type = "padding", val = 2 }
layout[5] = footer

local opts = {
  layout = layout,
  opts = {
    margin = 5,
    noautocmd = true
  },
}

alpha.setup(opts)
