local M = {
    lazy = false,
    "catppuccin/nvim",
    priority = 1000,
    opts = {
        flavour = "macchiato",
        integrations = {
            cmp = true,
            gitsigns = true,
            nvimtree = true,
            telescope = true,
            notify = true,
        }
    },
    config = function(_, opts)
        local colorscheme = require("catppuccin")
        colorscheme.setup(opts)
        colorscheme.load()
    end,
}

return M
