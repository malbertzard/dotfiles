return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            bigfile = { enabled = true },
            indent = { enabled = true },
            input = { enabled = false },
            notifier = { enabled = true },
            quickfile = { enabled = true },
            scroll = { enabled = false },
            scratch = { enabled = false },
            statuscolumn = { enabled = true },
            words = { enabled = true },
            dashboard = { enabled = true },
        },
        keys = {
            { "<leader>mZ", function() Snacks.zen.zoom() end,           desc = "Toggle Zoom" },
            { "<leader>m.", function() Snacks.scratch() end,            desc = "Toggle Scratch Buffer" },
            { "<leader>bd", function() Snacks.bufdelete() end,          desc = "Delete Buffer" },
            { "<leader>fR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
            { "<leader>gB", function() Snacks.gitbrowse() end,          desc = "Git Browse",           mode = { "n", "v" } },
            { "<leader>gb", function() Snacks.git.blame_line() end,     desc = "Git Blame Line" },
        },
    }
}
