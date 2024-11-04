local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")

    -- Register leader based mappings
    wk.add(
      {
        { "<leader>F",   group = "+Filetype" },
        { "<leader>H",   group = "+Help" },

        { "<leader>Q",   group = "+Quickfix" },
        { "<leader>Qj",  "<cmd>cnext<cr>",                                         desc = "Next Quickfix Item" },
        { "<leader>Qk",  "<cmd>cprevious<cr>",                                     desc = "Previous Quickfix Item" },
        -- { "<leader>Qq",  "<cmd>lua require('core.utils.functions').toggle_qf()<cr>", desc = "Toggle quickfix list" },

        { "<leader>T",   group = "+Tests" },
        { "<leader>a",   group = "+Annotation" },
        { "<leader>b",   group = "+Buffers" },

        { "<leader>e",   desc = "+Errors" },
        { "<leader>l",   desc = "+LSP" },
        { "<leader>lw",  desc = "+Workspaces" },

        { "<leader>m",   group = "+Misc" },
        { "<leader>ma",  "<cmd>Alpha<cr>",                                         desc = "Alpha" },
        { "<leader>ml",  "<cmd>Lazy<cr>",                                          desc = "Lazy" },
        { "<leader>mc",  "<cmd>:e $MYVIMRC<cr>",                                   desc = "Lazy" },

        { "<leader>t",   group = "+Term" },
        { "<leader>tT",  "<cmd>term<cr>",                                          desc = "Term" },
        { "<leader>th",  "<cmd>tabnew | term htop <cr>",                           desc = "htop" },
        { "<leader>ts",  "<cmd>split | term<cr>",                                  desc = "sSplit Term" },
        { "<leader>tt",  "<cmd>tabnew | term<cr>",                                 desc = "Tab Term" },
        { "<leader>tv",  "<cmd>vsplit | term<cr>",                                 desc = "vSplit Term" },

        { "<leader>s",   group = "+Search",                                        desc = "+Search" },
        { "<leader>f",   group = "+Find",                                          desc = "+Files" },

        -- Search stuff
        { "<leader>sd",  "<cmd>Telescope docker<cr>",                              desc = "Docker" },
        { "<leader>su",  "<cmd>Telescope undo<cr>",                                desc = "Undo" },
        { "<leader>sS",  "<cmd>Telescope grep_string<cr>",                         desc = "Find string under cursor" },
        { "<leader>ss",  "<cmd>Telescope live_grep theme=ivy<cr>",                 desc = "Find string" },

        { "<leader>sm",  group = "+Misc",                                          desc = "+Files" },
        { "<leader>smc", "<cmd>Telescope commands<cr>",                            desc = "Commands" },
        { "<leader>smG", "<cmd>Telescope registers<cr>",                           desc = "Registers" },
        { "<leader>smS", "<cmd>Telescope symbols<cr>",                             desc = "Emoji" },
        { "<leader>sm:", "<cmd>Telescope search_history<cr>",                      desc = "Search History" },
        { "<leader>sm;", "<cmd>Telescope command_history<cr>",                     desc = "Command history" },
        -- Git
        { "<leader>gh",  "<cmd>Telescope git_branches theme=ivy<cr>",              desc = "Branches" },
        { "<leader>gm",  "<cmd>Telescope git_commits theme=ivy<cr>",               desc = "Commits" },
        -- files
        { "<leader>ff",  "<cmd>Telescope git_files theme=ivy<cr>",                 desc = "Open file" },
        { "<leader>fF",  "<cmd>Telescope find_files no_ignore=true theme=ivy<cr>", desc = "Open file (ignore git)" },
        -- misc
        { "<leader>mt",  "<cmd>Telescope<cr>",                                     desc = "Telescope" },
        -- Docs
        { "<leader>Hm",  "<cmd>Telescope man_pages<cr>",                           desc = "Telescope man" },
        { "<leader>H?",  "<cmd>Telescope help_tags<cr>",                           desc = "Help" },
        { "<leader>Hk",  "<cmd>Telescope keymaps<cr>",                             desc = "Keymaps" },
        -- Other
        { "<leader>bb",  "<cmd>Telescope buffers<cr>",                             desc = "Bufferlist" },
        { "<C-f>",       "<cmd>Telescope current_buffer_fuzzy_find theme=ivy<cr>", desc = "Search in buffer" },

        { "<leader>z",   desc = "Spelling" },
      }
      , { prefix = "<leader>", mode = "n", {} })
  end,
}

return M
