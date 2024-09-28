local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")

    -- Register leader based mappings
    wk.add(
      {
        { "<leader>F",  group = "+Filetype" },
        { "<leader>H",  group = "+Help" },

        { "<leader>Q",  group = "+Quickfix" },
        { "<leader>Qj", "<cmd>cnext<cr>",                                           desc = "Next Quickfix Item" },
        { "<leader>Qk", "<cmd>cprevious<cr>",                                       desc = "Previous Quickfix Item" },
        { "<leader>Qq", "<cmd>lua require('core.utils.functions').toggle_qf()<cr>", desc = "Toggle quickfix list" },

        { "<leader>T",  group = "+Tests" },
        { "<leader>a",  group = "+Annotation" },
        { "<leader>b",  group = "+Buffers" },

        { "<leader>l",  desc = "+LSP" },
        { "<leader>lw", desc = "+Workspaces" },

        { "<leader>m",  group = "+Misc" },
        { "<leader>ma", "<cmd>Alpha<cr>",                                           desc = "Alpha" },
        { "<leader>ml", "<cmd>Lazy<cr>",                                            desc = "Lazy" },

        { "<leader>t",  group = "+Term" },
        { "<leader>tT", "<cmd>term<cr>",                                            desc = "Term" },
        { "<leader>th", "<cmd>tabnew | term htop <cr>",                             desc = "htop" },
        { "<leader>ts", "<cmd>split | term<cr>",                                    desc = "sSplit Term" },
        { "<leader>tt", "<cmd>tabnew | term<cr>",                                   desc = "Tab Term" },
        { "<leader>tv", "<cmd>vsplit | term<cr>",                                   desc = "vSplit Term" },

        { "<leader>s",  group = "+Search",                                                         desc = "+Search" },
        { "<leader>f",  group = "+Find",                                                         desc = "+Files" },

        -- Search stuff
        { "<leader>sc", "<cmd>Telescope commands<cr>",                              desc = "Commands" },
        { "<leader>sg", "<cmd>Telescope live_grep theme=ivy<cr>",                   desc = "Strings" },
        { "<leader>sO", "<cmd>Telescope vim_options<cr>",                           desc = "Vim Options" },
        { "<leader>sR", "<cmd>Telescope repo list theme=ivy<cr>",                   desc = "Repo" },
        { "<leader>st", "<cmd>Telescope tmux sessions theme=ivy<cr>",               desc = "Tmux" },
        { "<leader>sd", "<cmd>Telescope docker<cr>",                                desc = "Docker" },
        { "<leader>sG", "<cmd>Telescope registers<cr>",                             desc = "Registers" },
        { "<leader>ss", "<cmd>Telescope grep_string<cr>",                           desc = "Text under cursor" },
        { "<leader>sS", "<cmd>Telescope symbols<cr>",                               desc = "Emoji" },
        { "<leader>s:", "<cmd>Telescope search_history<cr>",                        desc = "Search History" },
        { "<leader>s;", "<cmd>Telescope command_history<cr>",                       desc = "Command history" },
        { "<leader>su", "<cmd>Telescope undo<cr>",                                  desc = "Undo" },

        -- Git
        { "<leader>gh", "<cmd>Telescope git_branches theme=ivy<cr>",                desc = "Branches" },
        { "<leader>gm", "<cmd>Telescope git_commits theme=ivy<cr>",                 desc = "Commits" },
        -- files
        { "<leader>ff", "<cmd>Telescope git_files theme=ivy<cr>",                   desc = "Open file" },
        { "<leader>fF", "<cmd>Telescope find_files no_ignore=true theme=ivy<cr>",   desc = "Open file (ignore git)" },
        { "<leader>fr", "<cmd>Telescope oldfiles<cr>",                              desc = "Recent files" },
        -- misc
        { "<leader>mt", "<cmd>Telescope<cr>",                                       desc = "Telescope" },
        -- Docs
        { "<leader>Hm", "<cmd>Telescope man_pages<cr>",                             desc = "Telescope man" },
        { "<leader>H?", "<cmd>Telescope help_tags<cr>",                             desc = "Help" },
        { "<leader>Hk", "<cmd>Telescope keymaps<cr>",                               desc = "Keymaps" },
        -- Other
        { "<leader>bb", "<cmd>Telescope buffers<cr>",                               desc = "Bufferlist" },
        { "<C-f>",      "<cmd>Telescope current_buffer_fuzzy_find theme=ivy<cr>",   desc = "Search in buffer" },

        { "<leader>z",  desc = "Spelling" },
      }
      , { prefix = "<leader>", mode = "n", {} })
  end,
}

return M
