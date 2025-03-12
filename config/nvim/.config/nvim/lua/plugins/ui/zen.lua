return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            zen = { enabled = true, },
        },
        keys = {
            { "<leader>mZ", function() Snacks.zen.zoom() end,           desc = "Toggle Zoom" },
        },
    }
}
