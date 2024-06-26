local M = {
    "rcarriga/nvim-notify",
    enabled = true,
    keys = {
        {
            "<leader>md",
            function()
                require("notify").dismiss({ silent = true, pending = true })
            end,
            desc = "Delete all Notifications",
        },
    },
    opts = {
        timeout = 3000,
        level = "ERROR",
        max_height = function()
            return math.floor(vim.o.lines * 0.75)
        end,
        max_width = function()
            return math.floor(vim.o.columns * 0.75)
        end,
    },
}

return M
