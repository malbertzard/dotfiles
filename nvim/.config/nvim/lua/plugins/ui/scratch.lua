return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            scratch = {
                enabled = true,
                ft = "markdown"
            },
        },
        keys = {
            { "<leader>mZ", function() Snacks.zen.zoom() end,           desc = "Toggle Zoom" },
            { "<leader>m.", function() Snacks.scratch() end,            desc = "Toggle Scratch Buffer" },
            { "<leader>bd", function() Snacks.bufdelete() end,          desc = "Delete Buffer" },
            { "<leader>fR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
            { "<leader>gB", function() Snacks.gitbrowse() end,          desc = "Git Browse",           mode = { "n", "v" } },
            { "<leader>gb", function() Snacks.git.blame_line() end,     desc = "Git Blame Line" },
            { "<leader>Tt", function() Snacks.terminal.toggle() end,    desc = "Toggle Terminal" },
        },
    }
}
