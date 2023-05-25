return {
    "j-hui/fidget.nvim",
    event = "VeryLazy",
    enabled = false,
    opts = {
        function()
            require("fidget").setup()
        end
    }
}
