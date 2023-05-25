return {
    "simrat39/symbols-outline.nvim",
    event = "LspAttach",
    opts = {
        function ()
            require("symbols-outline").setup()
        end
    },
    keys = {
        {"<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbol Outline"}
    }
}
