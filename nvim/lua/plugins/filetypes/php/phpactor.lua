local M = {
    "gbprod/phpactor.nvim",
    enabled = true,
    dependencies = {
        "nvim-lua/plenary.nvim", -- required to update phpactor
        "neovim/nvim-lspconfig" -- required to automaticly register lsp serveur
    },
    config = function()
        require("phpactor").setup({
            install = {
                bin = "/home/albertzard/.local/share/nvim/mason/bin/phpactor",
            }
        })
    end
}

return M
