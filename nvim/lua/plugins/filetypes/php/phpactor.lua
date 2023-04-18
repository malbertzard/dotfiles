local M = {
    "gbprod/phpactor.nvim",
    ft = "php",
    requires = {
        "nvim-lua/plenary.nvim", -- required to update phpactor
        "neovim/nvim-lspconfig" -- required to automaticly register lsp serveur
    },
    opt = function()
        require("phpactor").setup({ })
    end
}

return M
