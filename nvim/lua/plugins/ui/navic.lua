local M = {
    "SmiteshP/nvim-navic",
    enabled = false,
    init = function()
        vim.g.navic_silence = true
    end,
    opts = {
        highlight = true,
        lsp = {
            auto_attach = true,
        },
    },
}

return M
