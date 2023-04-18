return {
    "simrat39/symbols-outline.nvim",
    event = "LspAttach",
    config = {
        function ()
            require("symbols-outline").setup()
        end
    },
    keys = {
        {"<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbol Outline"}
    }
}
