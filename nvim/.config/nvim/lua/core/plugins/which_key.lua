local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")

    -- Register leader based mappings
    wk.add(
      {
        { "<leader>F",    group = "+Filetype" },
        { "<leader>H",    group = "+Help" },

        { "<leader>Q",    group = "+Quickfix" },
        { "<leader>Qj",   "<cmd>cnext<cr>",                                           desc = "Next Quickfix Item" },
        { "<leader>Qk",   "<cmd>cprevious<cr>",                                       desc = "Previous Quickfix Item" },
        { "<leader>Qq",   "<cmd>lua require('core.utils.functions').toggle_qf()<cr>", desc = "Toggle quickfix list" },

        { "<leader>T",    group = "+Tests" },
        { "<leader>a",    group = "+Annotation" },
        { "<leader>b",    group = "+Buffers" },

        { "<leader>l",    desc = "+LSP" },
        { "<leader>lw",   desc = "+Workspaces" },

        { "<leader>m",    group = "+Misc" },
        { "<leader>ma",   "<cmd>Alpha<cr>",                                           desc = "Alpha" },
        { "<leader>ml",   "<cmd>Lazy<cr>",                                            desc = "Lazy" },

        { "<leader>t",    group = "+Term" },
        { "<leader>tT",   "<cmd>term<cr>",                                            desc = "Term" },
        { "<leader>th",   "<cmd>tabnew | term htop <cr>",                             desc = "htop" },
        { "<leader>ts",   "<cmd>split | term<cr>",                                    desc = "sSplit Term" },
        { "<leader>tt",   "<cmd>tabnew | term<cr>",                                   desc = "Tab Term" },
        { "<leader>tv",   "<cmd>vsplit | term<cr>",                                   desc = "vSplit Term" },

        { "<leader>z",    desc = "Spelling" },
      }
      , { prefix = "<leader>", mode = "n", {} })
  end,
}

return M
