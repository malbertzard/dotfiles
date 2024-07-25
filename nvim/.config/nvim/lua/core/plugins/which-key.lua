local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    -- disable v
    -- local presets = require("which-key.plugins.presets")
    -- presets.operators["v"] = nil
    local icons = require("core.utils.icons")
    local wk = require("which-key")

    wk.setup({
      plugins = {
        marks = true,     -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
          enabled = false,
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
          operators = true,    -- adds help for operators like d, y, ... and registers them for motion / text object completion
          motions = true,      -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true,      -- default bindings on <c-w>
          nav = true,          -- misc bindings to work with windows
          z = true,            -- bindings for folds, spelling and others prefixed with z
          g = true,            -- bindings for prefixed with g
        },
      },
      -- add operators that will trigger motion and text object completion
      -- to enable all native operators, set the preset / operators plugin above
      operators = {},
      key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
      },
      icons = {
        breadcrumb = icons.arrows.DoubleArrowRight, -- symbol used in the command line area that shows your active key combo
        separator = icons.arrows.SmallArrowRight,   -- symbol used between a key and it's label
        group = icons.ui.Plus,                      -- symbol prepended to a group
      },
      window = {
        border = "none",           -- none, single, double, shadow
        position = "bottom",       -- bottom, top
        margin = { 0, 10, 3, 10 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 },  -- extra window padding [top, right, bottom, left]
      },
      layout = {
        height = { min = 3, max = 25 }, -- min and max height of the columns
        width = { min = 5, max = 50 },  -- min and max width of the columns
        spacing = 10,                   -- spacing between columns
        align = "center",               -- align columns left, center or right
      },
      ignore_missing = false,           -- enable this to hide mappings for which you didn't specify a label
      hidden = {
        "<silent>",
        "<cmd>",
        "<Cmd>",
        "<cr>",
        "<CR>",
        "call",
        "lua",
        "require",
        "Plug",
        "^:",
        "^ ",
      },                 -- hide mapping boilerplate
      show_help = false, -- show help message on the command line when the popup is visible
      triggers = "auto", -- automatically setup triggers
      -- triggers = {"<leader>"} -- or specify a list manually
      triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
      },
    })

    -- Register leader based mappings
    wk.add({
      m = {
        name = "Misc",
        a = { "<cmd>Alpha<cr>", "Alpha" },
        l = { "<cmd>Lazy<cr>", "Lazy" },
      },
      Q = {
        name = "+Quickfix",
        j = { "<cmd>cnext<cr>", "Next Quickfix Item" },
        k = { "<cmd>cprevious<cr>", "Previous Quickfix Item" },
        q = { "<cmd>lua require('core.utils.functions').toggle_qf()<cr>", "Toggle quickfix list" },
      },
      t = {
        name = "+Term",
        v = { "<cmd>vsplit | term<cr>", "vSplit Term" },
        s = { "<cmd>split | term<cr>", "sSplit Term" },
        T = { "<cmd>term<cr>", "Term" },
        t = { "<cmd>tabnew | term<cr>", "Tab Term" },
        h = { "<cmd>tabnew | term htop <cr>", "htop" },
        N = {
          -- Work Intern Tools
          name = "+NDS",
          u = { "<cmd>tabnew | term nds update <cr>", "Up" },
          U = { "<cmd>tabnew | term nds upgrade <cr>", "Upgrade" },
          i = { "<cmd>tabnew | term nds info <cr>", "Info" },
          r = { "<cmd>tabnew | term nds restart <cr>", "Restart" },
          E = { "<cmd>tabnew | term nds enter <cr>", "Enter" },
          S = { "<cmd>tabnew | term nds down <cr>", "Shutdown" },
          D = {
            name = "Database",
            i = { "<cmd>tabnew | term nds db:import <cr>", "Database Import" },
          }
        },
      },

      a = { name = "+Annotation" },
      b = { name = "+Buffers" },
      H = { name = "+Help" },
      T = { name = "+Tests" },
      F = { name = "+Filetype" },
      l = { "+LSP" },
      lw = { "+Workspaces" },

      z = { "Spelling" },
    }, { prefix = "<leader>", mode = "n", {} })
  end,
}

return M
