return {
    "j-hui/fidget.nvim",
    event = "VeryLazy",
    enabled = false,
    config = {},
    opt = {
        function()
            require("fidget").setup(config)
        end
    }
}
