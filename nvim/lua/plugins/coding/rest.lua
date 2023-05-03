local M = {
    "rest-nvim/rest.nvim",
    event = "VeryLazy",
    enabled = false,
    opt = {
        function ()
            require("rest.nvim").setup()
        end
    }
}

return M
